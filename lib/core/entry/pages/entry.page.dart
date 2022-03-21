import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class EntryPage extends StatefulWidget {
  static String routeName = '/entry';
  const EntryPage({Key? key}) : super(key: key);

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
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
                            toRoutesNamed([
                              EntryPage.routeName,
                              LoginPage.routeName,
                            ]);
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
