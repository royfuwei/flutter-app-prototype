import 'package:flutter/material.dart';

class CommonSliverListWidget<T> extends StatelessWidget {
  const CommonSliverListWidget({
    Key? key,
    required this.builder,
    this.items = const [],
  }) : super(key: key);
  final Widget Function(BuildContext, int, T) builder;
  final List<T> items;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodySliverList();
  }

  bodySliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (bc, idx) => builder(bc, idx, items[idx]),
        childCount: items.length,
      ),
    );
  }
}
