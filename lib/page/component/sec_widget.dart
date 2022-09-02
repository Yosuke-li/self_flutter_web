import 'package:flutter/material.dart';

class SecWidget extends StatefulWidget {
  final double offset;
  final int index;

  const SecWidget({Key? key, required this.offset, required this.index})
      : super(key: key);

  @override
  State<SecWidget> createState() => _SecWidgetState();
}

class _SecWidgetState extends State<SecWidget> {
  double offset = 0;

  @override
  void didUpdateWidget(covariant SecWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index + 1 > widget.offset &&
        (widget.offset - widget.index) > 0) {
      offset = widget.offset - widget.index;
      setState(() {});
      print('sec.offset: $offset');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 30,
            top: MediaQuery.of(context).size.height * 0.2,
            child: AnimatedOpacity(
              opacity: offset > 0.25 ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Archives',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Avalien', fontSize: 40),
              ),
            )),
        Positioned(
            right: 30,
            top: MediaQuery.of(context).size.height * 0.3,
            child: AnimatedOpacity(
              opacity: offset > 0.25 ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Text(
                'Self',
                style: TextStyle(
                    color: Colors.amberAccent, fontFamily: 'Avalien', fontSize: 40),
              ),
            )),
        Positioned(
            left: 30,
            top: MediaQuery.of(context).size.height * 0.35,
            child: AnimatedOpacity(
              opacity: offset > 0.4 ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Text(
                'Text code TextStyle(color: Colors.white, fontFamily:',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Avalien', fontSize: 40),
              ),
            )),
        Positioned(
            left: 30,
            top: MediaQuery.of(context).size.height * 0.5,
            child: AnimatedOpacity(
              opacity: offset > 0.7 ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Text(
                'Text code const Duration(seconds: 1)',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Avalien', fontSize: 40),
              ),
            )),
        Positioned(
          left: 30,
          top: MediaQuery.of(context).size.height * 0.65,
          child: AnimatedOpacity(
            opacity: offset > 0.8 ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Text(
              'Text code MediaQuery.of(context).size.height * 0.7',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Avalien', fontSize: 40),
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: MediaQuery.of(context).size.height * 0.35,
          child: AnimatedOpacity(
              opacity: offset > 0.7 ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Column(
                children: const [
                  Text(
                    'Text code MediaQuery.of(context).size.height * 0.7',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avalien',
                        fontSize: 40),
                  ),
                  Text(
                    'LocateStorage.setString(lastCity, val)',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avalien',
                        fontSize: 40),
                  ),
                  Text(
                    'WidgetsBinding.instance.addPostFrameCallback((timeStamp) ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avalien',
                        fontSize: 40),
                  ),
                  Text(
                    ' builder: (BuildContext context) => TabBarView(',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avalien',
                        fontSize: 40),
                  ),
                  Text(
                    'Overlay.of(context)?.insert(entry!);',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avalien',
                        fontSize: 40),
                  ),
                ],
              )),
        ),
        Positioned(
          right: 30,
          top: MediaQuery.of(context).size.height * 0.8,
          child: AnimatedOpacity(
            opacity: offset > 0.9 ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: const Text(
              'from xuan',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Avalien', fontSize: 40),
            ),
          ),
        ),
      ],
    );
  }
}
