import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class EntryBodyComponent extends StatefulWidget {
  const EntryBodyComponent({
    Key? key,
    this.onEnd,
  }) : super(key: key);
  final void Function()? onEnd;

  @override
  State<EntryBodyComponent> createState() => _EntryBodyComponentState();
}

class _EntryBodyComponentState extends State<EntryBodyComponent> {
  double logoOpacity = 1.0;
  bool startAnimation = false;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return SafeArea(
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
                        onEnd: widget.onEnd,
                      ),
                    ),
                    VerticalSpacing(of: 200),
                  ],
                )
              ],
            )),
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
