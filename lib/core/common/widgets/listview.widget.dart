import 'package:flutter/material.dart';

class CommonListViewWidget<T> extends StatelessWidget {
  const CommonListViewWidget({
    Key? key,
    required this.builder,
    this.items = const [],
  }) : super(key: key);
  final Widget Function(BuildContext, int, T) builder;
  final List<T> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return bodyListView();
  }

  bodyListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (bc, idx) => builder(bc, idx, items[idx]),
    );
  }
}
