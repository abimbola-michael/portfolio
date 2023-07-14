import 'package:flutter/material.dart';

import 'column_row.dart';

class CustomGridView extends StatelessWidget {
  final List items;
  final int gridSize;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Axis axis;
  final MainAxisSize mainAxisSize;
  final MainAxisSize itemsMainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment itemsMainAxisAlignment;
  final CrossAxisAlignment itemsCrossAxisAlignment;
  final Widget Function(int index) itemBuilder;
  final bool scrollable;
  final bool expanded;
  final ScrollController? scrollController;
  const CustomGridView({
    super.key,
    required this.items,
    required this.gridSize,
    required this.itemBuilder,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.axis = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.itemsMainAxisAlignment = MainAxisAlignment.start,
    this.itemsCrossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.itemsMainAxisSize = MainAxisSize.min,
    this.scrollable = false,
    this.expanded = false,
    this.scrollController,
  });

  List<int> convertToGrid(int pos, int gridSize) {
    return [pos % gridSize, pos ~/ gridSize];
  }

  int convertToPosition(List<int> grids, int gridSize) {
    return grids[0] + (grids[1] * gridSize);
  }

  Widget _buildLayout() {
    return ColumnOrRow(
      column: axis == Axis.vertical,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: List.generate((items.length / gridSize).ceil(), (colindex) {
        if (expanded) {
          return Expanded(child: _buildInnerLayout(colindex));
        }
        return _buildInnerLayout(colindex);
      }),
    );
  }

  Widget _buildInnerLayout(int colindex) {
    final colSize = (items.length / gridSize).ceil();
    final remainder = items.length % gridSize;
    return ColumnOrRow(
      mainAxisSize: itemsMainAxisSize,
      mainAxisAlignment: itemsMainAxisAlignment,
      crossAxisAlignment: itemsCrossAxisAlignment,
      column: axis != Axis.vertical,
      children: List.generate(
          colindex == colSize - 1 && remainder > 0 ? remainder : gridSize,
          (rowindex) =>
              itemBuilder(convertToPosition([rowindex, colindex], gridSize))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: items.isEmpty
          ? null
          : scrollable
              ? Scrollbar(
                  controller: scrollController,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: axis,
                    child: _buildLayout(),
                  ),
                )
              : _buildLayout(),
    );
  }
}
