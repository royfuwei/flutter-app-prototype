import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/login/screens/login_screen.dart';
import 'package:seeks_flutter/routes.dart';

class EntryScreen extends StatefulWidget {
  static String routeName = 'entry';
  const EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  double logoOpacity = 1.0;
  bool startAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgMainColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              logoOpacity = 0.0;
            });
          },
          child: AnimatedOpacity(
              opacity: startAnimation ? 0.0 : 1.0,
              duration: const Duration(
                milliseconds: 1000,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: startAnimation
                              ? 250.0
                              : MediaQuery.of(context).size.width,
                          child: seeksLogo,
                          onEnd: () {
                            routePushNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          },
                        ),
                      ),
                      VerticalSpacing(of: 200),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        startAnimation = true;
      });
    });
  }
}
