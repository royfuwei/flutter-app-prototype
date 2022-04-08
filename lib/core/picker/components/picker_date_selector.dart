import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        bottom: false,
        child: Container(
          color: Colors.white,
          height: 380,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // appBar(),
              Container(
                padding: EdgeInsets.only(bottom: 0),
                height: 250,
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
                padding: EdgeInsets.only(top: 10),
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
