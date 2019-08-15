import 'package:flutter/material.dart';
import 'package:flutter_app/res/Colours.dart';
import 'package:flutter_app/res/styles.dart';
import 'package:flutter_app/utils/CusLoadStatus.dart';
import 'package:flutter_app/widget/ProgressView.dart';

class StatusViews extends StatelessWidget {
  const StatusViews(this.status, {Key key, this.onTap}) : super(key: key);
  final int status;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case CusLoadStatus.refresh_error:
        return new Container(
          width: double.infinity,
          child: new Material(
            color: Colors.white,
            child: new InkWell(
              onTap: () {
                onTap();
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  new Image.asset(
//                    Utils.getImgPath("ic_network_error"),
//                    package: BaseConstant.packageBase,
//                    width: 100,
//                    height: 100,
//                  ),
                  Gaps.vGap10,
                  new Text(
                    "网络出问题了～ 请您查看网络设置",
                    style: TextStyles.listContent,
                  ),
                  Gaps.vGap5,
                  new Text(
                    "点击屏幕，重新加载",
                    style: TextStyles.listContent,
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case CusLoadStatus.loading:
        return new Container(
          alignment: Alignment.center,
          color: Colours.gray_f0,
          child: new ProgressView(),
        );
        break;
      case CusLoadStatus.refresh_empty:
        return new Container(
          color: Colors.white,
          width: double.infinity,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                new Image.asset(
//                  Utils.getImgPath("ic_data_empty"),
//                  package: BaseConstant.packageBase,
//                  width: 60,
//                  height: 60,
//                ),
                Gaps.vGap10,
                new Text(
                  "空空如也～",
                  style: TextStyles.listContent2,
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}
