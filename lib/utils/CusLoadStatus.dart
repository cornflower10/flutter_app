class CusLoadStatus {
  static const int refresh_success = 0;
  static const int refresh_error = 1;
  static const int refresh_empty = 2;
  static const int loadmore_success = 3;
  static const int loadmore_error = 4;
  static const int loadmore_empty = 5;
  static const int loading = 6;

  static int status(
      {bool hasError, List data, bool refresh, bool loadMore}) {
    if(refresh!=true&&loadMore!=true&&data==null&&hasError!=true){
      return loading;
    }
    if (refresh == true) {
      if (hasError == true) {
        return refresh_error;
      }
      if (data == null || data.isEmpty) {
        return refresh_empty;
      } else {
        return refresh_success;
      }
    } else if (loadMore==true) {
      if (hasError==true) {
        return loadmore_error;
      }
      if (data == null || data.isEmpty) {
        return loadmore_empty;
      } else {
        return loadmore_success;
      }
    }
  }
}
