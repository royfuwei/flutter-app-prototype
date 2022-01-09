import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevLocalStorage extends StatefulWidget {
  static String routeName = "dev/local/storage";
  const DevLocalStorage({Key? key}) : super(key: key);

  @override
  _DevLocalStorageState createState() => _DevLocalStorageState();
}

class _DevLocalStorageState extends State<DevLocalStorage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSearching = false;
  List<String> keywords = [];

  void getRecentKeywords() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      keywords = pref.getStringList("RecentKeywords") ?? [];
    });
  }

  void setRecentKeywords() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("RecentKeywords", keywords);
  }

  void clearRecentKeywords() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    keywords = [];
    pref.setStringList("RecentKeywords", keywords);
  }

  @override
  void initState() {
    super.initState();
    getRecentKeywords();
  }

  @override
  Widget build(BuildContext context) {
    final normalAppBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.amber,
        ),
        onPressed: () {
          setState(() {
            isSearching = true;
          });
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.restore_from_trash,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    print("clearRecentKeywords");
                    clearRecentKeywords();
                  });
                },
              ),
            )
          ],
        )
      ],
      title: Text("Local Storage"),
    );

    final searchAppBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          setState(() {
            isSearching = false;
          });
        },
      ),
      title: Container(
          padding: EdgeInsets.only(bottom: 16),
          child: TextField(
            style: TextStyle(color: Colors.white),
            textInputAction: TextInputAction.search,
            cursorColor: Colors.white,
            autofocus: true,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                )),
            onSubmitted: (string) {
              setState(() {
                isSearching = false;
                keywords.insert(0, string);
                setRecentKeywords();
              });
            },
          )),
    );

    return Scaffold(
      /* appBar: AppBar(
        title: Text("local storage"),
      ), */
      appBar: isSearching ? searchAppBar : normalAppBar,
      body: ListView.builder(
        itemCount: keywords.length,
        itemBuilder: (ctx, idx) => ListTile(
          title: Text(keywords[idx]),
        ),
      ),
    );
  }
}
