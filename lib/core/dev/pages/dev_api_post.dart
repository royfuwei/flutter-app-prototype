import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dev/components/api.dart';

class DevApiPost extends StatefulWidget {
  static String routeName = "/dev/api/post";
  const DevApiPost({Key? key}) : super(key: key);

  @override
  _DevApiPostState createState() => _DevApiPostState();
}

class _DevApiPostState extends State<DevApiPost> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final long = 66.0;
  final List<dynamic> formDataResults = [null, null, null];
  final List<dynamic> jsonResults = [null, null, null];
  final List<dynamic> wwwResults = [null, null, null];

  Widget _createContainer(String text) {
    return Container(
      height: long,
      alignment: Alignment.center,
      child: Text(text),
    );
  }

  Widget _createResultWidget(dynamic result) {
    //⭕️❌🆗🆖
    if (result == true) {
      return _createContainer("⭕️");
    } else if (result == false) {
      return _createContainer("❌");
    } else {
      return Container(height: long, child: CupertinoActivityIndicator());
    }
  }

  Widget _createTable() {
    return Table(columnWidths: {
      1: FixedColumnWidth(long),
      2: FixedColumnWidth(long),
      3: FixedColumnWidth(long),
    }, children: [
      TableRow(children: [
        _createContainer(""),
        _createContainer("HttpClient"),
        _createContainer("http"),
        _createContainer("Dio"),
      ]),
      TableRow(children: [
        _createContainer("json"),
        _createResultWidget(jsonResults[0]),
        _createResultWidget(jsonResults[1]),
        _createResultWidget(jsonResults[2]),
      ]),
      TableRow(children: [
        _createContainer("x-www-form-urlencoded"),
        _createResultWidget(wwwResults[0]),
        _createResultWidget(wwwResults[1]),
        _createResultWidget(wwwResults[2]),
      ]),
      TableRow(children: [
        _createContainer("form-data"),
        _createResultWidget(formDataResults[0]),
        _createResultWidget(formDataResults[1]),
        _createResultWidget(formDataResults[2]),
      ])
    ]);
  }

  @override
  void initState() {
    super.initState();
    //=============www
    APIManager().loginHttpClientWWW(() {
      setState(() {
        wwwResults[0] = true;
      });
    }, () {
      setState(() {
        wwwResults[0] = false;
      });
    });

    APIManager().loginHttpWWW(() {
      setState(() {
        wwwResults[1] = true;
      });
    }, () {
      setState(() {
        wwwResults[1] = false;
      });
    });

    APIManager().loginDioWWW(() {
      setState(() {
        wwwResults[2] = true;
      });
    }, () {
      setState(() {
        wwwResults[2] = false;
      });
    });

    //=============json
    APIManager().loginHttpClientJson(() {
      setState(() {
        jsonResults[0] = true;
      });
    }, () {
      setState(() {
        jsonResults[0] = false;
      });
    });

    APIManager().loginHttpJson(() {
      setState(() {
        jsonResults[1] = true;
      });
    }, () {
      setState(() {
        jsonResults[1] = false;
      });
    });

    APIManager().loginDioJson(() {
      setState(() {
        jsonResults[2] = true;
      });
    }, () {
      setState(() {
        jsonResults[2] = false;
      });
    });

    //=============Form
    APIManager().loginHttpClientForm(() {
      setState(() {
        formDataResults[0] = true;
      });
    }, () {
      setState(() {
        formDataResults[0] = false;
      });
    });

    APIManager().loginHttpForm(() {
      setState(() {
        formDataResults[1] = true;
      });
    }, () {
      setState(() {
        formDataResults[1] = false;
      });
    });

    APIManager().loginDioForm(() {
      setState(() {
        formDataResults[2] = true;
      });
    }, () {
      setState(() {
        formDataResults[2] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post api data"),
      ),
      body: Padding(padding: EdgeInsets.only(right: 8), child: _createTable()),
    );
  }
}
