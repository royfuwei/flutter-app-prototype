import 'package:flutter/material.dart';

class DevDraggableGridProto extends StatefulWidget {
  static String routeName = "/dev/draggable_grid_proto";
  const DevDraggableGridProto({Key? key}) : super(key: key);

  @override
  State<DevDraggableGridProto> createState() => _DevDraggableGridProtoState();
}

class _DevDraggableGridProtoState extends State<DevDraggableGridProto> {
  List<String> items = List.generate(20, (index) => "$index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return SafeArea(
      child: Container(
        color: Colors.amber.shade100,
        child: draggableGridView(),
      ),
    );
  }

  draggableGridView() {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext bc, int index) {
        var item = items[index];
        return dragTargetGridItem(item, index);
      },
    );
  }

  longPressGridItem(String item, int index) {
    return LongPressDraggable(
      data: index,
      child: gridItem(item),
      feedback: gridItem(item, size: 100, margin: 5),
      onDragStarted: () {
        print("onDragStarted: item: ${item}, index: ${index}");
      },
      onDragCompleted: () {
        print("onDragCompleted: item: ${item}, index: ${index}");
      },
      onDragEnd: (endDetail) {
        print(
            "onDragEnd: item: ${item}, index: ${index}, endDetail: ${endDetail}");
      },
      onDraggableCanceled: (velocity, offset) {
        print("onDraggableCanceled: item: ${item}, index: ${index}");
      },
      onDragUpdate: (updateDetail) {
        print("onDragUpdate: item: ${item}, index: ${index}");
      },
    );
  }

  dragTargetGridItem(String item, int index) {
    var longPressDraggable = longPressGridItem(item, index);
    return DragTarget<int>(
      builder: (context, candidateItems, rejectedItems) {
        print(
            'dragTargetGridItem item: ${item}, candidateItems: ${candidateItems}, rejectedItems: ${rejectedItems},');
        return longPressDraggable;
      },
      onAccept: (item) {
        print("item: ${item}");
      },
    );
  }

  gridItem(
    String item, {
    double size: 50,
    double margin: 15,
  }) {
    return Container(
      alignment: Alignment.center,
      key: ValueKey(item),
      height: size,
      width: size,
      margin: EdgeInsets.symmetric(
        horizontal: margin,
        vertical: margin,
      ),
      decoration: BoxDecoration(
        color: Colors.primaries[int.parse(item) % Colors.primaries.length],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        item,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
