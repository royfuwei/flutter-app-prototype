import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstPageWidget extends StatefulWidget {
  @override
  _FirstPageWidgetState createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(180, 253, 155, 1),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(180, 253, 155, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      // color: Color.fromRGBO(255, 255, 255, 0.6),
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(25, 25, 25, 0.1),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(0, 4),
                                blurRadius: 4),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '登入並享受你的全新交友旅程\n尋找你在世界上另一半的靈魂',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(64, 64, 64, 1),
                                  fontFamily: 'Jaldi',
                                  fontSize: 15,
                                  letterSpacing: -0.30000001192092896,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return
  }
}
