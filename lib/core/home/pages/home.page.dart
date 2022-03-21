import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: SafeArea(
              child: GestureDetector(
                child: ListView(
                  children: [
                    Slidable(
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: StretchMotion(),
                        // A pane can dismiss the Slidable.
                        /* dismissible: DismissiblePane(onDismissed: () {
          deleteListItem(index);
        }), */
                        // All actions are defined in the children parameter.
                        children: getStartActionMenu(1),
                      ),
                      endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [],
                      ),
                      child: datingItem(),
                    ),
                    Slidable(
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: StretchMotion(),
                        // A pane can dismiss the Slidable.
                        /* dismissible: DismissiblePane(onDismissed: () {
          deleteListItem(index);
        }), */
                        // All actions are defined in the children parameter.
                        children: getStartActionMenu(1),
                      ),
                      endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [],
                      ),
                      child: datingItem(),
                    ),
                    datingItem(),
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

  getStartActionMenu(int index) {
    return [
      SlidableAction(
        onPressed: (_) {
          // deleteListItem(index);
        },
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: '刪除',
      ),
      SlidableAction(
        // onPressed: doNothing,
        onPressed: (_) {},
        backgroundColor: Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.share,
        label: '分享',
      ),
    ];
  }

  datingItem({
    String username = "user1",
    DecorationImage userDecorationImage = const DecorationImage(
      image: AssetImage("assets/images/splash_2.jpg"),
      fit: BoxFit.cover,
    ),
    DecorationImage decorationImage = const DecorationImage(
      image: AssetImage("assets/images/splash_1.jpg"),
      fit: BoxFit.cover,
    ),
    Widget? image,
    String title = "一起讀書",
    String datingDate = "週四, 6月10日",
    String datingHour = "12:00-14:00",
    String status = "配對中",
    String datingDuration = "預計2hr",
    String signupCount = "100人報名",
    String payment = "-1000元",
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(context, 8),
            horizontal: getProportionateScreenWidth(context, 16),
          ),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                datingItemImage(
                  username: username,
                  userDecorationImage: userDecorationImage,
                  decorationImage: decorationImage,
                  image: Image.asset(
                    "assets/images/splash_1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                datingItemInfo(
                  title: title,
                  datingDate: datingDate,
                  datingHour: datingHour,
                  status: status,
                  datingDuration: datingDuration,
                  signupCount: signupCount,
                  payment: payment,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  datingItemInfoIcon(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  datingItemInfo({
    String title = "一起讀書",
    String datingDate = "週四, 6月10日",
    String datingHour = "12:00-14:00",
    String status = "配對中",
    String datingDuration = "預計2hr",
    String signupCount = "100人報名",
    String payment = "-1000元",
  }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 5,
        ),
        child: Container(
          // alignment: Alignment.centerLeft,
          height: getProportionateScreenHeight(context, 100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: colorFont02,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(context, 18),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            datingDate,
                            style: TextStyle(
                              color: colorFont03,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  getProportionateScreenWidth(context, 14),
                            ),
                          ),
                          Text(" "),
                          Text(
                            datingHour,
                            style: TextStyle(
                              color: colorFont03,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  getProportionateScreenWidth(context, 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerticalSpacing(
                    of: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: datingItemInfoIcon(
                      Icons.update,
                      status,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: datingItemInfoIcon(
                      Icons.access_time,
                      datingDuration,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: datingItemInfoIcon(
                      Icons.group_add,
                      signupCount,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: datingItemInfoIcon(
                      Icons.money_outlined,
                      payment,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  datingItemImage({
    String username = "user1",
    DecorationImage userDecorationImage = const DecorationImage(
      image: AssetImage("assets/images/splash_2.jpg"),
      fit: BoxFit.cover,
    ),
    DecorationImage decorationImage = const DecorationImage(
      image: AssetImage("assets/images/splash_1.jpg"),
      fit: BoxFit.cover,
    ),
    Widget? image,
  }) {
    return Container(
      height: getProportionateScreenHeight(context, 100),
      width: getProportionateScreenHeight(context, 100),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: decorationImage,
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: getProportionateScreenHeight(context, 100),
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
                child: image,
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
                      image: userDecorationImage,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 12,
                      bottom: 5,
                    ),
                    child: Text(
                      username,
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

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      // actions: [Text("hihi")],
      title: defaultAppBarTitle(startItems: [
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
      ], endItems: [
        appBarIconButton(Icons.location_on),
        appBarIconButton(Icons.search),
        appBarIconButton(Icons.filter_list),
      ]),
    );
  }

  appBarIconButton(
    IconData icon, {
    Color color = colorFont02,
  }) {
    return IconButton(
      iconSize: getProportionateScreenWidth(context, 32),
      onPressed: () {},
      padding: EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: color,
        size: getProportionateScreenWidth(context, 32),
      ),
    );
  }
}
