import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

class SearchWidget extends StatefulWidget {
  static String routeName = "/search_widget";
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FocusNode focusNode = FocusNode();
  bool onfocus = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> searchItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade800,
      body: body(),
    );
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      print("focusNode.hasFocus: ${focusNode.hasFocus}");
      if (focusNode.hasFocus) {
      } else {
        // getShowModalBottomSheet();
      }
    });
  }

  body() {
    return SafeArea(
      bottom: false,
      child: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: Container(
          child: Column(
            children: [
              searchSide(),
              Expanded(
                child: searchListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  searchListView() {
    return Container(
      child: ListView.builder(
        itemCount: searchItems.length,
        itemBuilder: (bc, idx) {
          print("searchItems[idx]: ${searchItems[idx]}");
          return Container(
            color: Colors.green.shade100,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            width: double.infinity,
            height: 100,
            child: Text(
              searchItems[idx],
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  searchSide() {
    return Container(
      constraints: BoxConstraints(
        // minHeight: getProportionateScreenHeight(context, 40),
        maxHeight: getProportionateScreenHeight(context, 56),
      ),
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: TextField(
        focusNode: focusNode,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(
            context,
            getProportionateScreenHeight(context, 16),
          ),
          color: Colors.black,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: "Search...",
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey.shade100,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey.shade100,
            ),
          ),
        ),
        onSubmitted: (string) {
          // goolgeMapController
          //     .moveCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
        },
      ),
    );
  }
}
