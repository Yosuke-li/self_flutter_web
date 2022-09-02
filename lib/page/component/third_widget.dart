import 'package:flutter/material.dart';

class ThirdWidget extends StatefulWidget {
  final double offset;
  final int index;

  const ThirdWidget({Key? key, required this.offset, required this.index})
      : super(key: key);

  @override
  State<ThirdWidget> createState() => _ThirdWidgetState();
}

class _ThirdWidgetState extends State<ThirdWidget> {
  double offset = 0;
  double outOffset = 0;

  @override
  void didUpdateWidget(covariant ThirdWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index + 1 > widget.offset &&
        (widget.offset - widget.index) > 0) {
      offset = widget.offset - widget.index;
    } else if (widget.offset.floor() == 2) {
      outOffset = widget.offset - widget.offset.floor();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 60,
          top: offset > 0.98
              ? MediaQuery.of(context).size.height * (1 - (outOffset/3) - 0.65)
              : MediaQuery.of(context).size.height * 0.35,
          child: AnimatedOpacity(
            opacity: (offset / 2) > 0.33 ? 1 : (offset / 2) / 0.33,
            duration: const Duration(seconds: 1),
            child: Container(
              child: const Text(
                'Web Design Title',
                style: TextStyle(
                  fontFamily: 'Avalien',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 60,
          top: offset > 0.98
              ? MediaQuery.of(context).size.height * (1 - (outOffset/3) - 0.53)
              : MediaQuery.of(context).size.height * 0.47,
          child: Container(
            child: const Text(
              'ChromeProxyService: Failed to evaluate expression',
              style: TextStyle(
                fontFamily: 'Avalien',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
        Positioned(
          left: 60,
          top: offset > 0.98
              ? MediaQuery.of(context).size.height * (1 - (outOffset/3) - 0.48)
              : MediaQuery.of(context).size.height * 0.52,
          child: Container(
            child: const Text(
              'expression Web Design Title.',
              style: TextStyle(
                fontFamily: 'Avalien',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
        Positioned(
          left: 60,
          top: offset > 0.98
              ? MediaQuery.of(context).size.height * (1 - (outOffset/3) - 0.43)
              : MediaQuery.of(context).size.height * 0.57,
          child: Container(
            child: const Text(
              'ChromeProxyService: Failed to evaluate',
              style: TextStyle(
                fontFamily: 'Avalien',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
        Positioned(
          left: 60,
          top: offset > 0.98
              ? MediaQuery.of(context).size.height * (1 - (outOffset/3) - 0.38)
              : MediaQuery.of(context).size.height * 0.62,
          child: Container(
            child: const Text(
              'Expression Web Design Title',
              style: TextStyle(
                fontFamily: 'Avalien',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
        Positioned(
          left: 60,
          top: offset > 0.98
              ? MediaQuery.of(context).size.height * (1 - (outOffset/3) - 0.33)
              : MediaQuery.of(context).size.height * 0.67,
          child: Container(
            child: const Text(
              'Container Design With Offset',
              style: TextStyle(
                fontFamily: 'Avalien',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
