import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_datetime.widget.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';

class DatingInfoListComponent extends StatelessWidget {
  const DatingInfoListComponent({
    Key? key,
    this.title = "",
    this.location = "",
    this.city = "",
    this.description = "",
    this.labelWidgets = const [],
    this.datingWeek = "",
    this.datingDate = "",
    this.datingRange = "",
    this.deadlineWeek = "",
    this.deadlineDate = "",
    this.deadlineTime = "",
  }) : super(key: key);

  final String title;
  final String location;
  final String city;
  final String description;
  final List<Widget> labelWidgets;
  final String datingWeek;
  final String datingDate;
  final String datingRange;
  final String deadlineWeek;
  final String deadlineDate;
  final String deadlineTime;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyDatingInfo(context);
  }

  bodyDatingInfo(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          bodyDatingInfoTitle(context, title),
          bodyDatingInfoLabel(context),
          bodyDatingInfoDateTime(context),
          bodyDatingInfoLocation(context),
          bodyDatingInfoContent(context),
          // VerticalSpacing(),
        ],
      ),
    );
  }

  bodyDatingInfoTitle(BuildContext context, String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(
            context,
            24,
          ),
        ),
      ),
    );
  }

  bodyDatingInfoLabel(
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Wrap(
        alignment: WrapAlignment.start,
        // direction: Axis.horizontal,
        spacing: 8,
        runSpacing: 2,
        children: labelWidgets,
      ),
    );
  }

  bodyDatingInfoDateTime(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: DatingDateTimeWidget(
        datingDate: datingDate,
        datingRange: datingRange,
        datingWeek: datingWeek,
        deadlineDate: deadlineDate,
        deadlineTime: deadlineTime,
        deadlineWeek: deadlineWeek,
      ),
    );
  }

  bodyDatingInfoLocation(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.place,
              size: getProportionateScreenWidth(context, 30),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(location),
                  Text(city),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bodyDatingInfoContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Text(
        // "歡迎一起約會、一起讀書",
        description,
      ),
    );
  }
}
