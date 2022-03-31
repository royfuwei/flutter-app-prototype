import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevGetx2Page1 extends GetView {
  static String routeName = "/dev/getx2_page1";
  // DevGetX2Controller controller = new DevGetX2Controller();
  // DevGetX2Controller controller2 = new DevGetX2Controller();
  DevGetX2Controller controller = Get.put(DevGetX2Controller());
  // DevGetX2Controller controller2 = Get.put(DevGetX2Controller());
  // DevGetX2Controller2 controller2 = Get.put(DevGetX2Controller2());

  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DevGetx2Page1:',
            ),
            GetX2CounterWidget(
              controller: controller,
            ),
            /* GetX2CounterWidget2(
              controller: controller2,
            ), */
            // ctl2IncreaseButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  /* ctl2IncreaseButton() {
    return TextButton(
      onPressed: () => controller2.increase(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
        padding: MaterialStateProperty.all(EdgeInsets.all(5)),
      ),
      child: Text("controller2.increase()"),
    );
  } */

  appBar() {
    return AppBar(
      title: Text('DevGetx2Page1'),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextButton(
            onPressed: () {
              print("Get.to(() => DevGetx2Page2())");
              // Get.to(() => DevGetx2Page2());
              Get.to(
                () => GetX2CounterPage(
                    // controller: controller2,
                    ),
              );
            },
            child: Text(
              "Next",
            ),
          ),
        ),
      ],
    );
  }

  _incrementCounter() {
    controller.increase();
  }
}

/* ------------------ */

/* ------------------ */
class DevGetx2Page2 extends StatefulWidget {
  static String routeName = "/dev/getx2_page2";
  const DevGetx2Page2({Key? key}) : super(key: key);

  @override
  State<DevGetx2Page2> createState() => _DevGetx2Page2State();
}

class _DevGetx2Page2State extends State<DevGetx2Page2> {
  // DevGetX2Controller controller = new DevGetX2Controller();
  DevGetX2Controller2 controller = Get.put(DevGetX2Controller2());

  // final DevGetX2Controller c = Get.find();

  @override
  void initState() {
    print("init state: ${controller.count}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DevGetx2Page2: ${controller.count}',
            ),
            GetX2CounterWidget2(
              controller: controller,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _incrementCounter() {
    print("controller.increase()");
    controller.increase();
  }

  appBar() {
    return AppBar(
      title: Text('DevGetx2Page2'),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextButton(
            onPressed: () {
              print("Get.to(() => DevGetx2Page1())");
              Get.to(() => DevGetx2Page1());
            },
            child: Text(
              "Next",
            ),
          ),
        ),
      ],
    );
  }
}

/* ------------------ */

class GetX2CounterWidget extends StatelessWidget {
  const GetX2CounterWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final DevGetX2Controller controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        '${controller._count}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
/* ------------------ */

class GetX2CounterWidget2 extends StatelessWidget {
  const GetX2CounterWidget2({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final DevGetX2Controller2 controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        '${controller._count}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

/* ------------------ */

class GetX2CounterPage extends StatelessWidget {
  const GetX2CounterPage({
    Key? key,
    this.controller,
  }) : super(key: key);
  final DevGetX2Controller? controller;

  @override
  Widget build(BuildContext context) {
    final DevGetX2Controller c =
        // controller == null ? Get.put(DevGetX2Controller()) : controller!;
        controller == null ? Get.find<DevGetX2Controller>() : controller!;

    final DevGetX2Controller2 controller2 = Get.find<DevGetX2Controller2>();
    _incrementCounter() {
      c.increase();
    }

    return Scaffold(
      appBar: appBar(c),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                '${c._count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Obx(
              () => Text(
                '${controller2._count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  appBar(DevGetX2Controller c) {
    return AppBar(
      title: Text('GetX2CounterPage'),
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: TextButton(
          onPressed: () {
            c.reset();
            Get.back();
          },
          child: Text(
            "back",
          ),
        ),
      ),
    );
  }
}

/* ------------------ */

class DevGetX2Controller extends GetxController {
  final _count = 0.obs;
  set count(value) => this._count.value = value;
  get count => this._count.value;

  increase() {
    count++;
    this.update();
  }

  reset() {
    count = 0;
    this.update();
  }
}

/* ------------------ */

class DevGetX2Controller2 extends GetxController {
  final _count = 0.obs;
  set count(value) => this._count.value = value;
  get count => this._count.value;

  increase() {
    count++;
    // this.update();
  }

  reset() {
    count = 0;
    // this.update();
  }
}
