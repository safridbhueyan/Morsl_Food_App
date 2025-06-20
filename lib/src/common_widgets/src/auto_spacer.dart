import 'package:flutter/cupertino.dart';

class AutoSpacer extends StatelessWidget {
  final double space;

  const AutoSpacer({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    final isInRow = context.findAncestorWidgetOfExactType<Row>() != null;
    final isInColumn = context.findAncestorWidgetOfExactType<Column>() != null;

    if (isInRow) {
      return SizedBox(width: space);
    } else if (isInColumn) {
      return SizedBox(height: space);
    } else {
      return SizedBox(width: space, height: space);
    }
  }
}
