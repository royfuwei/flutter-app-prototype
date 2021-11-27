import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_flow_content.dart';
import 'package:seeks_flutter/core/common/components/default_title.dart';
import 'package:seeks_flutter/core/common/components/status_button.dart';

class ImageUploadScreen extends StatefulWidget {
  static String routeName = "image/upload";
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  bool goNext = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultFlowPage(
        // contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          DefaultTitle(
            title: "上傳照片",
            subTitle: "請至少上傳一張照片",
          ),
          VerticalSpacing(of: 25),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            // height: MediaQuery.of(context).size.height * 0.3,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // 每行
                crossAxisCount: 3,
                // 子 Widget 寬高比
                childAspectRatio: 1.0,
                // 非滾動方向間距
                crossAxisSpacing: 24.0,
                // 滾動方向間距
                mainAxisSpacing: 24.0,
              ),
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        // side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: getProportionateScreenWidth(context, 40),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Transform.translate(
                        offset: Offset(10, -10),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel,
                            size: getProportionateScreenWidth(context, 32),
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.image,
                          size: getProportionateScreenWidth(context, 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "下一步",
              isDisabled: !goNext,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
