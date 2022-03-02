import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevListViewRefresh extends StatefulWidget {
  static String routeName = "dev/listview/refresh";
  const DevListViewRefresh({Key? key}) : super(key: key);

  @override
  _DevListViewRefreshState createState() => _DevListViewRefreshState();
}

class _DevListViewRefreshState extends State<DevListViewRefresh> {
  late Widget selector = Container();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final pageSize = 20;
  final maxPage = 3;

  int currentPage = 0;
  List<int> fibonacci = [];
  ScrollController _scrollController = ScrollController();

  List<int> _createFib() {
    List<int> fib = [];
    print("Help~~~");
    for (var index = 0; index < pageSize; index++) {
      if (index == 0 || index == 1) {
        if (fibonacci.isEmpty) {
          fib.add(index);
        } else if (index == 0) {
          fib.add(fibonacci[fibonacci.length - 2] + fibonacci.last);
        } else {
          fib.add(fibonacci.last + fib.first);
        }
      } else {
        fib.add(fib[index - 2] + fib[index - 1]);
      }
    }
    print(fib.toString());
    return fib;
  }

  @override
  void initState() {
    super.initState();
    fibonacci.addAll(_createFib());

    _scrollController.addListener(() {
      //這種監聽法, 在一開始資料就沒有超過頁面時會一直轉(shrinkWrap無效, 該不會只有children才作用吧)
      //思路1. 改監聽loading, 2.偷安插末筆資料, 3. 找其他可用的position
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          setState(() {
            if (currentPage < maxPage) {
              currentPage++;
              fibonacci.addAll(_createFib());
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            currentPage = 1;
            fibonacci.clear();
            fibonacci.addAll(_createFib());
          });
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: fibonacci.length,
          itemBuilder: (ctx, idx) {
            //如果設為-1才看得到loading, 但會暫時看不到當頁最後一筆 (條件二是防止看不到所有資料最後一筆)
            if (idx == fibonacci.length - 1 && currentPage < maxPage) {
              return Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return ListTile(title: Text("${idx + 1} : ${fibonacci[idx]}"));
            }
          },
        ),
      ),
    );
  }
}
