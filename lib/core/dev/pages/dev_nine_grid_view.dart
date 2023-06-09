import 'package:flutter/material.dart';
import 'package:nine_grid_view/nine_grid_view.dart';

class DevNineGridView extends StatefulWidget {
  static String routeName = "/dev/nine_grid_view";
  const DevNineGridView({Key? key}) : super(key: key);

  @override
  State<DevNineGridView> createState() => _DevNineGridViewState();
}

class _DevNineGridViewState extends State<DevNineGridView>
    with TickerProviderStateMixin {
  String _title = 'QQ Group';

  NineGridType _gridType = NineGridType.qqGp;

  // List<String> items = [];
  List<String> items = List.generate(20, (index) => "$index");

  @override
  void initState() {
    super.initState();
    // items = Utils.getTestData();
  }

  gridItem(
    String item,
    int index, {
    double size: 50,
    double margin: 1,
  }) {
    return Container(
      alignment: Alignment.center,
      key: ValueKey(item),
      height: size,
      width: size,
      margin: EdgeInsets.symmetric(
        horizontal: margin,
        vertical: margin,
      ),
      decoration: BoxDecoration(
        color: Colors.primaries[int.parse(item) % Colors.primaries.length],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "idx:${index}-${item}",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int _index) {
    int itemCount = _index % 9 + 1;
    if (_gridType == NineGridType.normal ||
        _gridType == NineGridType.weiBo ||
        _gridType == NineGridType.weChat) {
      return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.33, color: Color(0xffe5e5e5)))),
        padding: EdgeInsets.all(0),
        child: NineGridView(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(5),
          space: 5,
          type: _gridType,
          color: Color(0XFFE5E5E5),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return gridItem(items[index], index);
            // ImageBean bean = items[index];
            // return Utils.getWidget(bean.middlePath!);
          },
        ),
      );
    }
    itemCount = (_index % (_gridType == NineGridType.dingTalkGp ? 4 : 9) + 1);
    Decoration decoration = BoxDecoration(
      color: Color(0XFFE5E5E5),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );
    Widget header = NineGridView(
      width: 120,
      height: 120,
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      space: 3,
      type: _gridType,
      decoration: _gridType == NineGridType.weChatGp ? decoration : null,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        // ImageBean bean = items[index];
        // return Utils.getWidget(bean.middlePath!);
        return gridItem(items[index], index);
      },
    );

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.33, color: Color(0xffe5e5e5)))),
        child: Row(
          children: <Widget>[header],
        ),
      ),
    );
  }

  Widget _buildGroup(BuildContext context) {
    Decoration decoration = BoxDecoration(
      color: Color(0XFFE5E5E5),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );
    int total = 1;
    switch (_gridType) {
      case NineGridType.qqGp:
        total = 5;
        break;
      case NineGridType.weChatGp:
        total = 9;
        break;
      case NineGridType.dingTalkGp:
        total = 4;
        break;
    }
    List<Widget> children = [];
    for (int i = 0; i < 9; i++) {
      children.add(NineGridView(
        width: (MediaQuery.of(context).size.width - 60) / 3,
        height: (MediaQuery.of(context).size.width - 60) / 3,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        space: 3,
        //arcAngle: 60,
        type: _gridType,
        decoration: _gridType == NineGridType.dingTalkGp ? null : decoration,
        itemCount: i % total + 1,
        itemBuilder: (BuildContext context, int index) {
          // ImageBean bean = items[index];
          // return Utils.getWidget(bean.middlePath!);
          return gridItem(items[index], index);
        },
      ));
    }
    return Wrap(
      alignment: WrapAlignment.center,
      children: children,
    );
  }

  void _onPopSelected(NineGridType value) {
    print('Sky24n _onPopSelected...... $value');
    if (_gridType != value) {
      _gridType = value;
      switch (value) {
        case NineGridType.qqGp:
          _title = 'QQ Group';
          break;
        case NineGridType.weChatGp:
          _title = 'WeChat Group';
          break;
        case NineGridType.dingTalkGp:
          _title = 'DingTalk Group';
          break;
        case NineGridType.weChat:
          _title = 'WeChat';
          break;
        case NineGridType.weiBo:
          _title = 'WeiBo Intl';
          break;
        case NineGridType.normal:
          _title = 'Normal';
          break;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.settings),
              padding: const EdgeInsets.all(0.0),
              onSelected: _onPopSelected,
              itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<NineGridType>>[
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.qqGp,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'QQ Group',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.weChatGp,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'WeChat Group',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.dingTalkGp,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'DingTalk Group',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.weChat,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'WeChat',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.weiBo,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'WeiBo',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.normal,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'Normal',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.normal,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title: Text(
                            'Single Picture',
                          ),
                          onTap: () {
                            // Utils.pushPage(context, SinglePicturePage());
                          },
                        )),
                  ]),
        ],
      ),
      body: (_gridType == NineGridType.qqGp ||
              _gridType == NineGridType.weChatGp ||
              _gridType == NineGridType.dingTalkGp)
          ? ListView(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: <Widget>[
                SizedBox(height: 15),
                _buildGroup(context),
                Offstage(
                  offstage: _gridType != NineGridType.qqGp,
                  child: QQGroup(),
                ),
              ],
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 9,
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, index);
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Utils.pushPage(context, DragSortPage());
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

class QQGroup extends StatefulWidget {
  @override
  _QQGroupState createState() => _QQGroupState();
}

class _QQGroupState extends State<QQGroup> with TickerProviderStateMixin {
  late AnimationController _controller;
  // List<ImageBean> items = [];
  List<String> items = List.generate(20, (index) => "$index");

  @override
  void initState() {
    super.initState();
    // items = Utils.getTestData();
    _controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NineGridView(
        width: 200,
        height: 200,
        arcAngle: (_controller.value * 180).round().toDouble(),
        type: NineGridType.qqGp,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          // ImageBean bean = items[index];
          // return Utils.getWidget(bean.middlePath!);
          return gridItem(items[index], index);
        },
      ),
    );
  }

  gridItem(
    String item,
    int index, {
    double size: 50,
    double margin: 1,
  }) {
    return Container(
      alignment: Alignment.center,
      key: ValueKey(item),
      height: size,
      width: size,
      margin: EdgeInsets.symmetric(
        horizontal: margin,
        vertical: margin,
      ),
      decoration: BoxDecoration(
        color: Colors.primaries[int.parse(item) % Colors.primaries.length],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "idx:${index}-${item}",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
