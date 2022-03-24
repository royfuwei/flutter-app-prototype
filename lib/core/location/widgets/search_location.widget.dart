import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/location/widgets/google_map.widget.dart';

class SearchLocationWidget extends StatefulWidget {
  static String routeName = "/search_location";
  const SearchLocationWidget({Key? key}) : super(key: key);

  @override
  State<SearchLocationWidget> createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {
  late GoogleMapController goolgeMapController;
  FocusNode focusNode = FocusNode();
  bool onfocus = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
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
          color: Colors.amber.shade100,
          child: Stack(
            children: [
              getGoogleMap(),
              searchSide(),
            ],
          ),
        ),
      ),
    );
  }

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.42796133580664, 121.285749655962),
    zoom: 10.4746,
  );

  getGoogleMap() {
    return NotificationListener<GoogleMapWidgetNotification>(
      onNotification: (notification) {
        goolgeMapController = notification.controller;
        print("goolgeMapController: ${goolgeMapController}");
        print("_kGooglePlex: ${_kGooglePlex}");
        return true;
      },
      child: GoogleMapWidget(),
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

  getShowModalBottomSheet() {
    // scaffoldKey.currentState!.
    showBottomSheet(
      context: context,
      builder: (_) => Container(
        height: double.infinity,
        color: Colors.amber.shade100,
      ),
    );
  }
  /* showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container();
      },
    );
  } */

  getMediaWrap() {
    return Container(
      padding: EdgeInsets.only(),
      color: Colors.greenAccent,
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {
                      setState(() {
                        Navigator.pop(context);
                      })
                    }),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {
                setState(() {
                  Navigator.pop(context);
                })
              },
            ),
            /* VerticalSpacing(
              of: 50,
            ), */
          ],
        ),
      ),
    );
  }
}
