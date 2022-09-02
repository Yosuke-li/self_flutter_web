import 'package:flutter/material.dart';

class ForthWidget extends StatefulWidget {
  final double offset;
  final int index;
  const ForthWidget({Key? key, required this.offset, required this.index}) : super(key: key);

  @override
  State<ForthWidget> createState() => _ForthWidgetState();
}

class _ForthWidgetState extends State<ForthWidget> {
  double offset = 0;

  @override
  void didUpdateWidget(covariant ForthWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.index + 1 > widget.offset && (widget.offset - widget.index)>0) {
      offset = widget.offset - widget.index;
      print('forth.offset: $offset');
      print('forth.index: ${widget.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
