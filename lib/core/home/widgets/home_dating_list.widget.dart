import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeDatingListWidget extends StatefulWidget {
  const HomeDatingListWidget({
    Key? key,
    required this.builder,
    // this.childCount,
    this.items = const [],
  }) : super(key: key);

  final Widget? Function(BuildContext, int, DatingItemEntity) builder;
  final List<DatingItemEntity> items;

  @override
  State<HomeDatingListWidget> createState() => _HomeDatingListWidgetState();
}

class _HomeDatingListWidgetState extends State<HomeDatingListWidget> {
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
        (bc, idx) => widget.builder(bc, idx, widget.items[idx]),
        childCount: widget.items.length,
      ),
    );
  }
}
