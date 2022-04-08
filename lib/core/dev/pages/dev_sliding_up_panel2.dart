import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DevSlidingUpPanel2 extends StatefulWidget {
  static String routeName = "/dev_sliding_up_panel2";
  const DevSlidingUpPanel2({Key? key}) : super(key: key);

  @override
  State<DevSlidingUpPanel2> createState() => _DevSlidingUpPanel2State();
}

class _DevSlidingUpPanel2State extends State<DevSlidingUpPanel2> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 200;
  double _panelHeightClosed = 95.0;
  PanelController _pc = new PanelController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: body(),
    );
  }

  body() {
    return SlidingUpPanel(
      controller: _pc,
      maxHeight: _panelHeightOpen,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      parallaxOffset: 0.2,
      /* body: Center(
          child: Text("This is the Widget behind the sliding panel"),
        ), */
      body: _body(),
      collapsed: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
        ),
        child: Center(
          child: Text(
            "This is the collapsed Widget",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // panelBuilder: (sc) => _panel(sc),
      panel: Center(
        child: Text("This is the sliding Widget"),
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      onPanelSlide: (double pos) {
        /* setState(
          () {
            _fabHeight =
                pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
          },
        ); */
      },
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Open"),
            onPressed: () => _pc.open(),
          ),
          RaisedButton(
            child: Text("Close"),
            onPressed: () => _pc.close(),
          ),
          RaisedButton(
            child: Text("Show"),
            onPressed: () => _pc.show(),
          ),
          RaisedButton(
            child: Text("Hide"),
            onPressed: () => _pc.hide(),
          ),
        ],
      ),
    );
  }
}
