import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevCustomScrollView extends StatefulWidget {
  static String routeName = "/dev/custom_scroll_view";
  const DevCustomScrollView({Key? key}) : super(key: key);

  @override
  _DevCustomScrollViewState createState() => _DevCustomScrollViewState();
}

class _DevCustomScrollViewState extends State<DevCustomScrollView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final space = 10.0;
  final tintColor = Colors.pinkAccent.withOpacity(0.5);

  final horizontalKey = new GlobalKey();

  void scrollToTop() {
    Scrollable.ensureVisible(context);
  }

  Widget _createCell(String title) {
    return Card(
      color: tintColor,
      child: InkWell(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(space),
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500))),
        onTap: title.startsWith("horizontal") ? scrollToTop : null,
      ),
    );
  }

  Widget buildNoArrowRefreshIndicator(
    BuildContext context,
    RefreshIndicatorMode refreshState,
    double pulledExtent,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
  ) {
    const Curve opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: refreshState == RefreshIndicatorMode.drag
            ? Opacity(
                opacity: opacityCurve.transform(
                    min(pulledExtent / refreshTriggerPullDistance, 1.0)),
                child: Icon(
                  CupertinoIcons.car_detailed,
                  color: CupertinoDynamicColor.resolve(
                      CupertinoColors.inactiveGray, context),
                  size: 36.0,
                ),
              )
            : Opacity(
                opacity: opacityCurve
                    .transform(min(pulledExtent / refreshIndicatorExtent, 1.0)),
                child: const CupertinoActivityIndicator(radius: 14.0),
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //頂
          SliverAppBar(
            backgroundColor: tintColor,
            // pinned: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollView"),
              background: Image.asset(
                "assets/logo/seeks_logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          //拉
          CupertinoSliverRefreshControl(
            builder: buildNoArrowRefreshIndicator,
            onRefresh: () async {
              print("拉爽的");
            },
          ),

          //上
          SliverPadding(
            padding: EdgeInsets.only(top: space, left: space, right: space),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((ctx, idx) {
                return _createCell("Grid\n$idx");
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: space,
                  crossAxisSpacing: space,
                  childAspectRatio: 1),
            ),
          ),

          //中
          SliverFixedExtentList(
            key: horizontalKey,
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate((ctx, idx) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (ctx, idx) {
                    return _createCell("horizontal\n$idx");
                  });
            }, childCount: 1),
          ),

          //下
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, idx) {
              return _createCell("list $idx");
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
