import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: AppBar(
              // elevation: 0.5,
              elevation: 0,
              backgroundColor: Colors.white,
              // actions: [Text("hihi")],
              title: appBarTitle(),
            ),
            body: SafeArea(
              child: GestureDetector(
                child: ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        color: Colors.grey[50],
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(context, 8),
                            horizontal:
                                getProportionateScreenWidth(context, 16),
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                datingImageItem(),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    // child: Image.asset(
                                    //   "assets/images/splash_1.jpg",
                                    //   fit: BoxFit.cover,
                                    // ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("一起讀書"),
                                                Row(
                                                  children: [
                                                    Text("週四, 6月10日"),
                                                    Text(" "),
                                                    Text("12:00-14:00"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Icon(Icons.more_vert),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            VerticalSpacing(
                                              of: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.update,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    "媒合中",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    "預計2hr",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.group_add,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    "100人報名",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.money_outlined,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    "-1000元",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // child:
                    ),
                    /* Center(
                      child: Container(
                        width: getProportionateScreenWidth(context, 120),
                        height: getProportionateScreenHeight(context, 110),
                        // color: Colors.grey,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/splash_1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ), */
                  ],
                ),
                // child: SingleChildScrollView(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  datingImageItem() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/images/splash_1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 100,
              height: 40,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.grey,
                      Colors.black,
                    ],
                    stops: [
                      0.0,
                      0.7,
                      1.0,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: Image.asset(
                  "assets/images/splash_1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/splash_2.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 12,
                      bottom: 5,
                    ),
                    child: Text(
                      "user",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(
                          context,
                          16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  appBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(),
              child: Row(
                children: [
                  Text(
                    "台灣",
                    style: TextStyle(
                      color: colorFont02,
                      fontSize: getProportionateScreenWidth(context, 24),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: colorFont02,
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              iconSize: getProportionateScreenWidth(context, 32),
              onPressed: () {},
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.location_on,
                color: colorFont02,
              ),
            ),
            IconButton(
              iconSize: getProportionateScreenWidth(context, 32),
              onPressed: () {},
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.search,
                color: colorFont02,
              ),
            ),
            IconButton(
              iconSize: getProportionateScreenWidth(context, 32),
              onPressed: () {},
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.filter_list,
                color: colorFont02,
                size: getProportionateScreenWidth(context, 32),
              ),
            ),
          ],
        )
      ],
    );
  }
}
