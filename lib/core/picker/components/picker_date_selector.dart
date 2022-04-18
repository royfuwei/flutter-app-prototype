import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

birthDateTimePicker({
  required BuildContext context,
  required void Function(DateTime) onDateTimeChanged,
}) {
  var now = DateTime.now();
  var minimumDate = now.subtract(Duration(days: 365 * 120));
  var maximumDate = now.subtract(Duration(days: 365 * 18));
  showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return SafeArea(
        // bottom: false,
        child: Container(
          color: Colors.white,
          height: getProportionateScreenHeight(context, 400),
          // height: 380,
          // height: MediaQuery.of(context).size.height / 2.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // appBar(),
              Container(
                // padding: EdgeInsets.only(bottom: 0),
                // padding: EdgeInsets.symmetric(vertical: 24),
                color: Colors.grey.shade100,
                // height: MediaQuery.of(context).size.height / 4,
                // height: 250,
                height: getProportionateScreenHeight(context, 240),
                child: CupertinoDatePicker(
                  // minuteInterval: 30,
                  // mode: CupertinoDatePickerMode.dateAndTime,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: maximumDate,
                  minimumDate: minimumDate,
                  maximumDate: maximumDate,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CupertinoButton(
                  color: Colors.green.shade500,
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // popOkButton(),
            ],
          ),
        ),
      );
    },
  );
}
