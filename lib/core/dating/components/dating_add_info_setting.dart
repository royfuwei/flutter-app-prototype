import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_datetime.widget.dart';

class DatingAddInfoSettingComponent extends StatefulWidget {
  const DatingAddInfoSettingComponent({Key? key}) : super(key: key);

  @override
  State<DatingAddInfoSettingComponent> createState() =>
      _DatingAddInfoSettingComponentState();
}

class _DatingAddInfoSettingComponentState
    extends State<DatingAddInfoSettingComponent> {
  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return datingSettingSide(context);
  }

  datingSettingSide(BuildContext context) {
    return Container(
      child: Column(children: [
        datingSettingItem(
          context: context,
          title: "約會設定",
          errorTitle: "請設定約會費用",
          onPressed: () {},
          widget: datingItemPayment(
            context: context,
          ),
        ),
        datingSettingItem(
          context: context,
          title: "新增時間",
          errorTitle: "請設定約會日期",
          onPressed: () {},
          widget: datingItemDateTime(
            context: context,
          ),
        ),
        datingSettingItem(
          context: context,
          title: "新增地點",
          errorTitle: "請設定約會地點",
          onPressed: () {},
          widget: datingItemLocation(
            context: context,
          ),
        ),
      ]),
    );
  }

  datingItemPayment({
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.payment,
              color: colorFont02,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "1000元 我請客",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(context, 18),
                    color: colorFont02,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  datingItemLocation({
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.place,
                size: getProportionateScreenWidth(context, 30),
                color: colorFont02,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "台灣台北市信義區華納威秀 CASHBANK",
                      style: TextStyle(
                        color: colorFont02,
                      ),
                    ),
                    Text(
                      "台北市",
                      style: TextStyle(
                        color: colorFont02,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  datingItemDateTime({
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        // width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: Row(
          children: [
            Icon(
              Icons.date_range_outlined,
              color: colorFont02,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: DatingDateTimeWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  datingSettingItem({
    required BuildContext context,
    String title = "約會設定",
    String errorTitle = "錯誤訊息",
    bool isError = false,
    Widget? widget,
    void Function()? onPressed,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 8, top: 24, right: 8, bottom: 8),
            child: TextButton(
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget != null
                      ? widget
                      : datingSettingItemDefault(
                          context: context,
                          title: title,
                          isError: isError,
                          onPressed: onPressed,
                        ),
                  Icon(
                    Icons.arrow_forward_ios,
                    // size: getProportionateScreenWidth(context, 30),
                    color: colorFont02,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Divider(
              height: 2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  datingSettingItemDefault({
    required BuildContext context,
    String title = "約會設定",
    String errorTitle = "錯誤訊息",
    bool isError = false,
    void Function()? onPressed,
  }) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(
                context,
                getProportionateScreenHeight(context, 18),
              ),
              color: isError ? Colors.red : Colors.black,
            ),
          ),
          isError
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    errorTitle,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(
                        context,
                        getProportionateScreenHeight(context, 14),
                      ),
                      color: Colors.red,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
