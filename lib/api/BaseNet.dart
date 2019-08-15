import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/api/BaseData.dart';
import 'package:flutter_app/api/Contants.dart';
import 'package:flutter_app/utils/CusException.dart';
import 'package:flutter_app/utils/LogUtils.dart';

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.status,
    this.code,
    this.messge,
    this.data,
    this.options,
    this.pem,
    this.pKCSPath,
    this.pKCSPwd,
  });

  /// BaseResp [String status]字段 key, 默认：status.
  String status;

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String code;

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String messge;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// Options.
  Options options;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PEM证书内容.
  String pem;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书路径.
  String pKCSPath;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书密码.
  String pKCSPwd;
}
class BaseNet {

  static final BaseNet _singleton = BaseNet._init();
  static Dio _dio;

  /// BaseResp [String status]字段 key, 默认：status.
  String _statusKey = "status";

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _codeKey = "code";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _msgKey = "msg";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  /// Options.
  Options _options = getDefOptions();

  /// PEM证书内容.
  String _pem;

  /// PKCS12 证书路径.
  String _pKCSPath;

  /// PKCS12 证书密码.
  String _pKCSPwd;

  static BaseNet getInstance() {
    return _singleton;
  }

  factory BaseNet() {
    return _singleton;
  }

  BaseNet._init() {
    _dio = new Dio(_options);
  }


  void setCookie(String cookie) {
    Map<String, dynamic> _headers = new Map();
    _headers["Cookie"] = cookie;
    _dio.options.headers.addAll(_headers);
  }

  /// set Config.
  void setConfig(HttpConfig config) {
    _statusKey = config.status ?? _statusKey;
    _codeKey = config.code ?? _codeKey;
    _msgKey = config.messge ?? _msgKey;
    _dataKey = config.data ?? _dataKey;
    _mergeOption(config.options);
    _pem = config.pem ?? _pem;
    if (_dio != null) {
      _dio.options = _options;
      if (_pem != null) {
        _dio.onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            if (cert.pem == _pem) {
              // 证书一致，则放行
              return true;
            }
            return false;
          };
        };
      }
      if (_pKCSPath != null) {
        _dio.onHttpClientCreate = (HttpClient client) {
          SecurityContext sc = new SecurityContext();
          //file为证书路径
          sc.setTrustedCertificates(_pKCSPath, password: _pKCSPwd);
          HttpClient httpClient = new HttpClient(context: sc);
          return httpClient;
        };
      }
    }
  }

  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  /// <BaseData<T> 返回 status code msg data .
  Future<BaseData<T>> request<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response response;
    try{
       response = await _dio.request(path,
          data: data,
          options: _checkOptions(method, options),
          cancelToken: cancelToken);
      _printHttpLog(response);
    } on DioError catch(error){
      throw CusException(Contants.NET_ERROR_CODE,formatError(error));

    }

    String _status;
    String _code;
    String _msg;
    T _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          _status = (response.data[_statusKey] is int)
              ? response.data[_statusKey].toString()
              : response.data[_statusKey];
          _code = response.data[_codeKey];
          _msg = response.data[_msgKey];
          _data = response.data[_dataKey];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(response);
          _status = (_dataMap[_statusKey] is int)
              ? _dataMap[_statusKey].toString()
              : _dataMap[_statusKey];
          _code = (_dataMap[_codeKey] is String)
              ? int.tryParse(_dataMap[_codeKey])
              : _dataMap[_codeKey];
          _msg = _dataMap[_msgKey];
          _data = _dataMap[_dataKey];
        }
        return new BaseData(_status, _code, _msg, _data);
      }on DioError catch (e) {
        throw CusException(Contants.NET_ERROR_CODE,formatError(e));
//        return new Future.error(new DioError(
//          response: response,
//          message: "data parsing exception...",
//          type: DioErrorType.RESPONSE,
//        ));
      }
    }
  }


  /*
   * error统一处理
   */
  String formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT
        ||e.type == DioErrorType.RECEIVE_TIMEOUT
        ||e.type == DioErrorType.RESPONSE) {
      // It occurs when url is opened timeout.
      return "网络异常";
    }
     else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      return "请求取消";
    } else if(e.message!=null&&e.message.contains('SocketException')){
      //SocketException: OS Error: Connection refused, errno = 111, address = 172.16.123.217, port = 54283
       //SocketException: Connection failed (OS Error: Network is unreachable, errno = 101), address = 172.16.123.217, port = 8081
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      return"网络异常";
    }else{
      return"未知错误:"+e.message;
    }
  }



  /// Make http request with options.
  /// [method] The request method.
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  /// <BaseData<T> 返回 status code msg data  Response.
//  Future<BaseData<T>> requestR<T>(String method, String path,
//      {data, Options options, CancelToken cancelToken}) async {
//    Response response = await _dio.request(path,
//        data: data,
//        options: _checkOptions(method, options),
//        cancelToken: cancelToken);
//    _printHttpLog(response);
//    String _status;
//    int _code;
//    String _msg;
//    T _data;
//    if (response.statusCode == HttpStatus.ok ||
//        response.statusCode == HttpStatus.created) {
//      try {
//        if (response.data is Map) {
//          _status = (response.data[_statusKey] is int)
//              ? response.data[_statusKey].toString()
//              : response.data[_statusKey];
//          _code = (response.data[_codeKey] is String)
//              ? int.tryParse(response.data[_codeKey])
//              : response.data[_codeKey];
//          _msg = response.data[_msgKey];
//          _data = response.data[_dataKey];
//        } else {
//          Map<String, dynamic> _dataMap = _decodeData(response);
//          _status = (_dataMap[_statusKey] is int)
//              ? _dataMap[_statusKey].toString()
//              : _dataMap[_statusKey];
//          _code = (_dataMap[_codeKey] is String)
//              ? int.tryParse(_dataMap[_codeKey])
//              : _dataMap[_codeKey];
//          _msg = _dataMap[_msgKey];
//          _data = _dataMap[_dataKey];
//        }
//        return new BaseData(_status, _code, _msg, _data, response);
//      } catch (e) {
//        return new Future.error(new DioError(
//          response: response,
//          message: "data parsing exception...",
//          type: DioErrorType.RESPONSE,
//        ));
//      }
//    }
//    return new Future.error(new DioError(
//      response: response,
//      message: "statusCode: $response.statusCode, service error",
//      type: DioErrorType.RESPONSE,
//    ));
//  }

  /// Download the file and save it in local. The default http method is "GET",you can custom it by [Options.method].
  /// [urlPath]: The file url.
  /// [savePath]: The path to save the downloading file later.
  /// [onProgress]: The callback to listen downloading progress.please refer to [OnDownloadProgress].
  Future<Response> download(String urlPath,
      savePath, {
        OnDownloadProgress onProgress,
        CancelToken cancelToken,
        data,
        Options options,
      }) {
    return _dio.download(urlPath, savePath,
        onProgress: onProgress,
        cancelToken: cancelToken,
        data: data,
        options: options);
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data
            .toString()
            .isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  /// check Options.
  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }

  /// merge Option.
  void _mergeOption(Options opt) {
    _options.method = opt.method ?? _options.method;
    _options.headers = (new Map.from(_options.headers))
      ..addAll(opt.headers);
    _options.baseUrl = opt.baseUrl ?? _options.baseUrl;
    _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
    _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
    _options.responseType = opt.responseType ?? _options.responseType;
    _options.data = opt.data ?? _options.data;
    _options.extra = (new Map.from(_options.extra))
      ..addAll(opt.extra);
    _options.contentType = opt.contentType ?? _options.contentType;
    _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
    _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
  }

  /// print Http Log.
  void _printHttpLog(Response response) {

    try {
      LogUtils.d("----------------Http Log----------------" +
          "\n[statusCode]:   " +
          response.statusCode.toString() +
          "\n[request   ]:   " +
          _getOptionsStr(response.request));
      _printDataStr("reqdata ", response.request.data);
      _printDataStr("response", response.data);
    } catch (ex) {
      print("Http Log" + " error......");
    }
  }

  /// get Options Str.
  String _getOptionsStr(Options request) {
    return "method: " +
        request.method +
        "  baseUrl: " +
        request.baseUrl +
        "  path: " +
        request.path;
  }

  /// print Data Str.
  void _printDataStr(String tag, Object value) {
    String da = value.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("[$tag  ]:   " + da.substring(0, 512));
        da = da.substring(512, da.length);
      } else {
        print("[$tag  ]:   " + da);
        da = "";
      }
    }
  }

  /// get dio.
  Dio getDio() {
    return _dio;
  }

  /// create new dio.
  static Dio createNewDio([Options options]) {
    options = options ?? getDefOptions();
    Dio dio = new Dio(options);
    return dio;
  }

  /// get Def Options.
  static Options getDefOptions() {
    Options options = new Options();
    options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    options.connectTimeout = 1000 * 30;
    options.receiveTimeout = 1000 * 30;
    return options;
  }
}
