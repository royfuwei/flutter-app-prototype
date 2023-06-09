import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dev/components/api.dart';
import 'package:seeks_app_prototype/core/dev/models/user.dart';

class DevApiGet extends StatefulWidget {
  static String routeName = "/dev/api/get";
  const DevApiGet({Key? key}) : super(key: key);

  @override
  _DevApiGetState createState() => _DevApiGetState();
}

class _DevApiGetState extends State<DevApiGet> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Users? currentUsers;

  @override
  void initState() {
    super.initState();
    APIManager().getUsers((p0) {
      setState(() {
        currentUsers = p0;
      });
    });
  }

  getUsersList(Users? currentUsers) {
    var hud = Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );

    var list = ListView.builder(
      itemExtent: 80,
      itemCount: (currentUsers == null) ? 0 : currentUsers.userList.length,
      itemBuilder: (ctx, idx) {
        var user = currentUsers!.userList[idx];

        return Card(
          child: ListTile(
            leading: Container(
              constraints: BoxConstraints(minWidth: 60, minHeight: 60),
              color: Colors.black38,
              child: Image.network(user.avatar, fit: BoxFit.fill),
            ),
            title: Text("${user.firstName} ${user.lastName}"),
            subtitle: Text(user.email),
          ),
        );
      },
    );
    return (currentUsers == null) ? hud : list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("get api data"),
      ),
      body: getUsersList(currentUsers),
    );
  }
}
