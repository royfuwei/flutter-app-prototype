import 'package:flutter/material.dart';

class DevReordableList extends StatefulWidget {
  static String routeName = "/dev/reordable_list";
  const DevReordableList({Key? key}) : super(key: key);

  @override
  State<DevReordableList> createState() => _DevReordableListState();
}

class _DevReordableListState extends State<DevReordableList> {
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
        child: ReorderableListView(
          scrollDirection: Axis.vertical,
          children: [
            for (String item in items)
              Container(
                alignment: Alignment.center,
                key: ValueKey(item),
                height: 100,
                width: 100,
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[int.parse(item) % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  item,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )
          ],
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            var child = items.removeAt(oldIndex);
            items.insert(newIndex, child);
            setState(() {});
          },
        ),
      ),
    );
  }
}
