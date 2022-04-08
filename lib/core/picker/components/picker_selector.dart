import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/domain/picker.dart';

CupertinoPicker getPickerSelector(
  int initialItem,
  List<PickerValueEntity> items,
  void Function(PickerValueEntity)? onSelectedItemChanged,
  Widget Function(PickerValueEntity) generator,
) {
  return CupertinoPicker(
    scrollController: FixedExtentScrollController(initialItem: initialItem),
    itemExtent: 30,
    onSelectedItemChanged: onSelectedItemChanged != null
        ? (index) => onSelectedItemChanged(items[index])
        : null,
    children: List.generate(
      items.length,
      ((index) => generator(items[index])),
    ),
  );
}

void showPickerSelector({
  int initialItem = 0,
  required BuildContext context,
  required List<PickerValueEntity> items,
  void Function(PickerValueEntity)? onSelectedItemChanged,
  required Widget Function(PickerValueEntity) generator,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return Container(
        color: Colors.white,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VerticalSpacing(
              of: 25,
            ),
            Container(
              height: 100,
              child: getPickerSelector(
                initialItem,
                items,
                onSelectedItemChanged,
                generator,
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
          ],
        ),
      );
    },
  );
}

void showSelectorBottomSheet({
  required BuildContext context,
  required List<PickerValueEntity> items,
  required Widget Function(PickerValueEntity) generator,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) => Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      child: getSelectWrap(items, generator),
    ),
  );
}

getSelectWrap(
  List<PickerValueEntity> items,
  Widget Function(PickerValueEntity) generator,
) {
  return Container(
    padding: EdgeInsets.only(),
    // color: Colors.greenAccent,
    child: SafeArea(
      child: Wrap(
        children: List.generate(items.length, (idx) => generator(items[idx])),
      ),
    ),
  );
}
