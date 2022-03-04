import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class DatingAddScreen extends StatefulWidget {
  static String routeName = "dating_add";
  const DatingAddScreen({Key? key}) : super(key: key);

  @override
  _DatingAddScreenState createState() => _DatingAddScreenState();
}

class _DatingAddScreenState extends State<DatingAddScreen> {
  int currentPage = 0;
  int pageLength = 1;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          name: DatingAddScreen.routeName,
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
  }

  body() {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          // bodyImageTest(),
          bodyImage(),
          bodySelecter(),
          bodyGridViewBuilder(),
        ],
      ),
    );
  }

  bodyImageTest() {
    return Container(
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          Icons.image,
          size: getProportionateScreenWidth(context, 40),
        ),
      ),
    );
  }

  bodyImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: colorIconHidden,
      child: pageLength == 0
          ? Center(
              child: Icon(
                Icons.camera_alt_outlined,
                size: 40,
              ),
            )
          : imageFilesSplash(),
    );
  }

  imageFilesSplash() {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: pageLength,
                itemBuilder: (context, index) {
                  return bodyImageTest();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pageLength, (index) {
                  if (pageLength > 1) {
                    return buildDot(index);
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int? index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  bodyGridViewBuilder() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          // 子 Widget 寬高比
          childAspectRatio: 1.0,
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                kPrimaryColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 0.2,
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  size: getProportionateScreenWidth(context, 40),
                ),
                Text(
                  "$index",
                  style: TextStyle(
                    color: colorIconHidden,
                    fontSize: getProportionateScreenWidth(
                      context,
                      20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bodySelecter() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: getProportionateScreenWidth(context, 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  "最近項目",
                  style: TextStyle(
                    color: colorIconHidden,
                    fontSize: getProportionateScreenWidth(context, 20),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: colorIconHidden,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.camera_alt,
                    color: colorIconHidden,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      // elevation: 0,
      // backgroundColor: Colors.white,
      backgroundColor: colorBarWhite,
      title: defaultExpandedAppBarTitle(
        startItems: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(
              Icons.close,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          Text(
            "新約會",
            style: TextStyle(
              color: colorFont02,
              fontSize: getProportionateScreenWidth(context, 20),
            ),
          ),
        ],
        endItems: [
          TextButton(
            onPressed: () {
              print('hihi');
            },
            child: Row(
              children: [
                isActivedButton(false, "下一步"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  isActivedButton(bool isRead, String text) {
    return TextButton(
      onPressed: isRead
          ? () {
              setState(() {
                // 目前沒有效果
                isRead = !isRead;
              });
            }
          : null,
      child: Row(
        children: [
          /* Icon(
            Icons.check,
            color: isRead ? Colors.green : colorFont03,
          ), */
          Text(
            text,
            style: TextStyle(
              color: isRead ? Colors.green : colorFont03,
              fontSize: getProportionateScreenWidth(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
