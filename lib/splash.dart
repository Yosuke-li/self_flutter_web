import 'package:flutter/material.dart';
import 'package:self_utils/global/store.dart';
import 'package:self_utils/utils/event_bus/event_util.dart';
import 'package:self_utils/utils/navigator.dart';
import 'package:self_utils/utils/screen.dart';
import 'package:self_utils/widget/animate_router.dart';

import 'page/index.dart' as index;
import 'page/index.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  void setTimer() {
    _timer = Timer(const Duration(seconds: 5), () {
      toIndex();
    });
    setState(() {});
  }

  void toIndex() {
    LocateStorage.setBoolWithExpire(
      'SplashShow',
      true,
      const Duration(days: 1),
    );
    NavigatorUtils.pushWidget(context, const IndexPage(),
        replaceRoot: true, type: AnimateType.Fade);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Image.asset(
                'images/plane2.gif',
                width: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
