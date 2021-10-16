import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestFirstPageWidget extends StatefulWidget {
  @override
  _TestFirstPageWidgetState createState() => _TestFirstPageWidgetState();
}

class _TestFirstPageWidgetState extends State<TestFirstPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
        color: Color.fromRGBO(180, 253, 155, 1),
      ),
      child: Column(
        children: <Widget>[
          Positioned(
              // top: 609,
              bottom: 609,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 90, vertical: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '登入/註冊',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(89, 89, 89, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
