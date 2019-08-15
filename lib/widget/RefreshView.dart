import 'package:flutter/material.dart';
import 'package:flutter_app/utils/CusLoadStatus.dart';
import 'package:flutter_app/utils/LogUtils.dart';
import 'package:flutter_app/widget/StatusViews.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef void OnLoadMore({bool up});
typedef OnRefreshCallback = Future<void> Function({bool isReload});

class RefreshView extends StatelessWidget {
  ScrollController scrollController;
  Widget child;
  OnRefreshCallback onRefresh;

  OnLoadMore loadMore;

  RefreshController refreshController;

  int status;
  bool enablePullUp;

  RefreshView({Key key,
    this.status,
    this.scrollController,
    this.child,
    this.onRefresh,
    this.loadMore,
    this.enablePullUp,
    @required this.refreshController})
      : assert(refreshController != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == CusLoadStatus.refresh_error ||
        status == CusLoadStatus.refresh_success) {
      refreshController.refreshCompleted();
      LogUtils.d("refreshCompleted");
    } else if (status == CusLoadStatus.loadmore_error ||
        status == CusLoadStatus.loadmore_success) {
      refreshController.loadComplete();
      LogUtils.d("loadComplete");
    }
    return Scaffold(
        body: new Stack(
          children: <Widget>[
            SmartRefresher(
              controller: refreshController,
              enablePullDown: enablePullUp,
              enablePullUp: true,
              footer: ClassicFooter(),
              header: WaterDropHeader(),
              child: child,
              onRefresh: onRefresh,
              onLoading: loadMore,
            ),
            new StatusViews(
              status,
              onTap: () {
                onRefresh(isReload: true);
              },
            ),
          ],
        ));
  }
}
