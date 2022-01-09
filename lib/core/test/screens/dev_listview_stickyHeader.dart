import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:sticky_headers/sticky_headers.dart';

final rainbowColors = [
  Colors.red,
  Colors.orangeAccent,
  Colors.yellowAccent,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

class DevListViewStickyHeader extends StatefulWidget {
  static String routeName = "dev/listview/stickyHeader";
  const DevListViewStickyHeader({Key? key}) : super(key: key);

  @override
  _DevListViewStickyHeaderState createState() =>
      _DevListViewStickyHeaderState();
}

class _DevListViewStickyHeaderState extends State<DevListViewStickyHeader> {
  late Widget selector = Container();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      // print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  final List<List<String>> stairs = List.generate(
    rainbowColors.length,
    (index) {
      return List.generate(
        index + 1,
        (index) {
          return "";
        },
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("infinite list"),
      ),
      // body: infiniteList(),
      body: limitList(),
    );
  }

  final _controller = ScrollController();
  final _height = 50.0;

  _animateToIndex(i) => _controller.animateTo(
        _height * i,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );

  limitList() {
    return ListView.builder(
      controller: _controller,
      itemCount: stairs.length,
      itemBuilder: (ctx, section) {
        return StickyHeaderBuilder(
          builder: (ctx, amount) {
            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text("Header $section"),
                onTap: () {
                  print("section: ${section}, amount: ${amount}");
                  // _controller.jumpTo(offset);
                  /* _controller.animateTo(
                    offset * 1,
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                  ); */
                  // _animateToIndex(items);
                },
              ),
            );
          },
          content: Column(
            children: List.generate(stairs[section].length, (row) {
              // print("row: ${row}, section: ${section}");
              // print("stairs[section]: ${stairs[section]}");
              return Container(
                color: rainbowColors[row],
                child: ListTile(
                  title: Text("Cell $row"),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  infiniteList() {
    //真正的無限列表XD
    return ListView.builder(
      itemBuilder: (context, index) {
        return StickyHeader(
          header: Container(
            height: 50.0,
            color: Colors.blueGrey[700],
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Header #$index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          content: Container(
            height: 200,
            child: Text("test"),
          ),
        );
      },
    );
  }
}
