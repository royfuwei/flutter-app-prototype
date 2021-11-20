import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';

class EntryScreen extends StatefulWidget {
  static String routeName = 'entryScreen';
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
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              logoOpacity = 1.0;
            });
          },
          child: AnimatedOpacity(
            opacity: startAnimation ? 1.0 : 0.0,
            duration: const Duration(
              milliseconds: 1000,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              width: startAnimation ? 350.0 : 250.0,
              child: seeksLogo,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        startAnimation = true;
      });
    });
  }
}
