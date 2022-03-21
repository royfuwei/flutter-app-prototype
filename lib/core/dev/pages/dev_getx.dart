import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevGetX extends StatefulWidget {
  static String routeName = "/dev/getx";
  const DevGetX({Key? key}) : super(key: key);

  @override
  _DevGetXState createState() => _DevGetXState();
}

class _DevGetXState extends State<DevGetX> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final DevGetXController controller = Get.put(DevGetXController());
  // final DevGetXController controller = Get.find<DevGetXController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Column(
        children: [
          Obx(
            () {
              return Expanded(
                flex: 1,
                child: ListView(
                  children:
                      List.generate(controller.someBasicList.length, (index) {
                    final title = controller.someBasicList[index];
                    return Center(child: Text(title));
                  }),
                ),
              );
            },
          ),
          GetBuilder<DevGetXController>(
            id: "enum", //對應到DevGetXController64行的 update(["enum"]);
            init: controller,
            builder: (_) {
              return Center(child: Text(controller.enumSelectState.toString()));
            },
          ),

          GetBuilder<DevGetXController>(
            init: controller,
            builder: (_) {
              return Expanded(
                flex: 1,
                child: ListView(
                  children:
                      List.generate(controller.someModelList.length, (index) {
                    final title = controller.someModelList[index].name;
                    return Center(child: Text(title));
                  }),
                ),
              );
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CupertinoButton(
          //     color: Colors.blue,
          //     child: Text("someString changed"),
          //     onPressed: () {
          //       if (controller.someString.isEmpty) {
          //         controller.someString = "someString changed";
          //       } else {
          //         controller.someString = "";
          //       }
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CupertinoButton(
          //     color: Colors.blue,
          //     child: Text("someInt changed"),
          //     onPressed: () {
          //       if (controller.someInt == 0) {
          //         controller.someInt = 99;
          //       } else {
          //         controller.someInt = 0;
          //       }
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CupertinoButton(
          //     color: Colors.blue,
          //     child: Text("someBool changed"),
          //     onPressed: () => controller.someBool = !controller.someBool,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CupertinoButton(
          //     color: Colors.blue,
          //     child: Text("someBasicList changed"),
          //     onPressed: () {
          //       controller.addBasicList();
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              color: Colors.blue,
              child: Text("enum changed"),
              onPressed: () {
                controller.enumChanged();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              color: Colors.blue,
              child: Text("someModelList changed"),
              onPressed: () {
                controller.addSomeModelList();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DevGetXController extends GetxController {
  final _someString = ''.obs;
  set someString(value) => this._someString.value = value;
  get someString => this._someString.value;

  //int
  final _someInt = 0.obs;
  set someInt(value) => this._someInt.value = value;
  get someInt => this._someInt.value;

  //bool
  final _someBool = false.obs;
  set someBool(value) => this._someBool.value = value;
  get someBool => this._someBool.value;

  //List
  final _someBasicList = <String>[].obs;
  set someBasicList(value) => this._someBasicList.value = value;
  get someBasicList => this._someBasicList.toList();

  //List<DataModel>
  final _someModelList = <SomeModel>[].obs;
  set someModelList(value) => this._someModelList.value = value;
  List<SomeModel> get someModelList => this._someModelList.toList();

  //Map
  final someDict = {}.obs;

  //Enum
  final _enumSelectState = Rx<SomeEnumState>(SomeEnumState.stateOne);
  set enumSelectState(value) => this._enumSelectState.value = value;
  get enumSelectState => this._enumSelectState.value;

  @override
  void onInit() {
    enumSelectState = SomeEnumState.stateThree;
    super.onInit();
  }

  addSomeModelList() {
    final someModel = SomeModel()
      ..id = 55
      ..name = "itHome"
      ..trueFalse = true;
    _someModelList.add(someModel);
    this.update();
  }

  enumChanged() {
    switch (enumSelectState) {
      case SomeEnumState.stateOne:
        enumSelectState = SomeEnumState.stateTwo;
        break;
      case SomeEnumState.stateTwo:
        enumSelectState = SomeEnumState.stateThree;
        break;
      case SomeEnumState.stateThree:
        enumSelectState = SomeEnumState.stateOne;
        break;
    }
    update(["enum"]);
  }

  addBasicList() {
    _someBasicList.add("add");
  }
}

class SomeModel {
  int id = 0;
  String name = "";
  bool trueFalse = false;

  SomeModel();

  SomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    trueFalse = json['trueFalse'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['truealse'] = this.trueFalse;
    return data;
  }
}

enum SomeEnumState {
  stateOne,
  stateTwo,
  stateThree,
}
