import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:seeks_flutter/configs/size_config.dart';

class FormError extends StatelessWidget {
  final List<String> errors;
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(
          error: errors[index],
        ),
      ),
    );
  }

  Padding formErrorText({String error}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
      child: Row(
        children: [
          Icon(
            MdiIcons.fromString("alert-circle-outline"),
            size: 18.0,
            color: Colors.red,
          ),
          SizedBox(
            width: getProportionateScreenHeight(10),
          ),
          Text(error),
        ],
      ),
    );
  }
}
