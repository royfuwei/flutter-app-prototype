import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_button.dart';

class StatusButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final void Function()? press;
  const StatusButton({
    Key? key,
    String this.text = "",
    bool this.isDisabled = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: text,
      press: isDisabled ? null : press,
      color: isDisabled ? colorFont03 : colorFont02,
      bgButtonColor: isDisabled ? colorIconHidden : colorIconAdd,
      isElevation: !isDisabled,
    );
  }
}
