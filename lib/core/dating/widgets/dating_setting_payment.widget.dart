import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

enum DatingPaymentType { GIVE, RECIVE }

class DatingPaymentEntity {
  String name;

  DatingPaymentType type;
  DatingPaymentEntity({
    this.name = "我請客",
    this.type = DatingPaymentType.GIVE,
  });
}

List<DatingPaymentEntity> datingPaymentList = [];

class DatingSettingPaymentWidget extends StatelessWidget {
  static String routeName = "/dating_setting_payment";
  const DatingSettingPaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  body(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            // color: Colors.amber.shade100,
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (position) {},
              children: [
                Text(
                  "我請客",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(
                      context,
                      getProportionateScreenHeight(context, 28),
                    ),
                    color: Colors.black,
                  ),
                ),
                Text(
                  "你買單",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(
                      context,
                      getProportionateScreenHeight(context, 28),
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
