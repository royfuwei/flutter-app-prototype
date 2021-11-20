import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class DefaultFlowPage extends StatelessWidget {
  final MainAxisAlignment contentMainAxisAlignment;
  final CrossAxisAlignment contentCrossAxisAlignment;
  final MainAxisAlignment buttomMainAxisAlignment;
  final CrossAxisAlignment buttomCrossAxisAlignment;
  final List<Widget> content;
  final List<Widget> buttom;
  const DefaultFlowPage({
    Key? key,
    this.contentMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.contentCrossAxisAlignment = CrossAxisAlignment.start,
    this.buttomMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.buttomCrossAxisAlignment = CrossAxisAlignment.start,
    required this.content,
    required this.buttom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: seeksLoginColor01),
        elevation: 0,
        backgroundColor: colorBarWhite,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context, 24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: contentMainAxisAlignment,
                crossAxisAlignment: contentCrossAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                children: content,
              ),
              Column(
                mainAxisAlignment: buttomMainAxisAlignment,
                crossAxisAlignment: buttomCrossAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                children: buttom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultFlowContent extends StatefulWidget {
  final MainAxisAlignment contentMainAxisAlignment;
  final CrossAxisAlignment contentCrossAxisAlignment;
  final MainAxisAlignment buttomMainAxisAlignment;
  final CrossAxisAlignment buttomCrossAxisAlignment;
  final List<Widget> content;
  final List<Widget> buttom;
  const DefaultFlowContent({
    Key? key,
    this.contentMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.contentCrossAxisAlignment = CrossAxisAlignment.start,
    this.buttomMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.buttomCrossAxisAlignment = CrossAxisAlignment.start,
    required this.content,
    required this.buttom,
  }) : super(key: key);

  @override
  _DefaultFlowContentState createState() => _DefaultFlowContentState();
}

class _DefaultFlowContentState extends State<DefaultFlowContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: seeksLoginColor01),
        elevation: 0,
        backgroundColor: colorBarWhite,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context, 24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
