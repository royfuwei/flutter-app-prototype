import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

class DevDraggableGrid extends StatefulWidget {
  static String routeName = "/dev/draggable_grid";
  const DevDraggableGrid({Key? key}) : super(key: key);

  @override
  State<DevDraggableGrid> createState() => _DevDraggableGridState();
}

class _DevDraggableGridState extends State<DevDraggableGrid> {
  List<String> items = List.generate(20, (index) => "$index");

  String? selectItem;
  int? targetIndex;
  int? selectIndex;
  bool isLongDraggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // delayDleteItem([5, 6]);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  delayDleteItem(List<int> deleteIndexs) {
    if (deleteIndexs.isNotEmpty) {
      var deleteIndex = deleteIndexs[0];
      items.removeAt(deleteIndex);
      deleteIndexs.removeAt(0);
      setState(() {});
      Future.delayed(Duration(seconds: 1), () {
        delayDleteItem(deleteIndexs);
      });
    }
  }

  body() {
    return SafeArea(
      child: Container(
        color: Colors.amber.shade100,
        child: Column(
          children: [
            Expanded(
              child: draggableGridView(),
            ),
          ],
        ),
      ),
    );
  }

  draggableGridView() {
    return GridView.builder(
      itemCount: items.length,
      addAutomaticKeepAlives: false,
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
      key: ValueKey(item),
      data: index,
      child: gridItem(item, index),
      feedback: gridItem(item, index, size: 100, margin: 5),
      onDragStarted: () {
        selectItem = item;
        selectIndex = index;
        isLongDraggle = true;
        setState(() {});
        // print("onDragStarted: item: ${item}, index: ${index}");
      },
      onDragCompleted: () {
        selectItem = null;
        selectIndex = null;
        isLongDraggle = false;
        setState(() {});
        // print("onDragCompleted: item: ${item}, index: ${index}");
      },
      onDraggableCanceled: (velocity, offset) {
        selectItem = null;
        selectIndex = null;
        isLongDraggle = false;
        setState(() {});
        // print("onDragCompleted: item: ${item}, index: ${index}");
      },
      onDragEnd: (endDetail) {
        updateDragItems();
        // print(
        //     "onDragEnd: item: ${item}, index: ${index}, endDetail: ${endDetail}");
        /* if (selectIndex != targetIndex) {
          var newIndex = targetIndex!;
          if (selectIndex! < newIndex) {
            // newIndex -= 1;
          }
          var child = items.removeAt(selectIndex!);
          items.insert(newIndex, child);
          setState(() {});
        } */
      },
      onDragUpdate: (updateDetail) {
        // print(
        //     "onDragUpdate: item: ${item}, index: ${index}, selectIndex: ${selectIndex}, targetIndex: ${targetIndex}");

        /* if (selectIndex != targetIndex) {
          var newIndex = targetIndex!;
          if (selectIndex! < newIndex) {
            // newIndex -= 1;
          }
          var child = items.removeAt(selectIndex!);
          items.insert(newIndex, child);
          setState(() {});
        } */
      },
    );
  }

  dragTargetGridItem(String item, int index) {
    return DragTarget<int>(
      key: ValueKey(item),
      builder: (context, candidateItems, rejectedItems) {
        if (candidateItems.isNotEmpty) {
          targetIndex = index;
          print(
            'dragTargetGridItem item: ${item}, index: ${index}, candidateItems: ${candidateItems}, rejectedItems: ${rejectedItems},',
          );
        }
        return longPressGridItem(item, index);
      },
      onAccept: (index) {
        print("onAccept index: ${index}");
      },
      onMove: (targetDetail) {
        /*  print(
          "onMove data: ${targetDetail.data}, offset: ${targetDetail.offset}",
        ); */
      },
      onLeave: (index) {
        print("onLeave index: ${index}");
      },
    );
  }

  updateDragItems() {
    if (selectIndex != targetIndex) {
      var newIndex = targetIndex!;
      if (selectIndex! < newIndex) {
        // newIndex -= 1;
      }
      var child = items.removeAt(selectIndex!);
      items.insert(newIndex, child);
      setState(() {});
    }
  }

  /* updateDragItems(int newIndex, int oldIndex) {
    if (newIndex != oldIndex) {
      /* if (oldIndex < newIndex) {
        newIndex -= 1;
      } */
      var child = items.removeAt(oldIndex);
      items.insert(newIndex, child);
      setState(() {});
    }
  } */

  gridItem(
    String item,
    int index, {
    double size: 50,
    double margin: 1,
  }) {
    return selectIndex != index
        ? Container(
            alignment: Alignment.center,
            key: ValueKey(item),
            height: size,
            width: size,
            margin: EdgeInsets.symmetric(
              horizontal: margin,
              vertical: margin,
            ),
            decoration: BoxDecoration(
              color:
                  Colors.primaries[int.parse(item) % Colors.primaries.length],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "idx:${index}-${item}",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                isLongDraggle && selectIndex != index
                    ? stackIndex(index)
                    : Container(),
              ],
            ),
          )
        : Container();
  }

  stackIndex(int index) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: 3, top: 3),
        child: Container(
          width: getProportionateScreenWidth(context, 24),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text(
              "${index}",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(context, 18),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
