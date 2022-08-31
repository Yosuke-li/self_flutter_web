import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:self_utils/global/store.dart';
import 'package:self_utils/utils/screen.dart';
import 'package:self_utils/widget/app_lifecycle_widget.dart';
import 'package:self_utils/widget/keyboard/keyboard_root.dart';
import 'package:self_utils/widget/modal_utils.dart';
import 'package:self_utils/widget/navigator_helper.dart';

import 'global/global.dart';
import 'page/index.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool? todayShowAd;

  @override
  void initState() {
    Future<void>.delayed(Duration.zero, () async {
      await init();
    });
    super.initState();
  }

  Future<void> init() async {
    await LocateStorage.init().whenComplete(
      () => getTodayShow(),
    );
  }

  void getTodayShow() {
    final bool? splashShow = LocateStorage.getBoolWithExpire('SplashShow');
    if (splashShow == true) {
      todayShowAd = true;
    } else {
      todayShowAd = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      child: NavigatorInitializer(
        child: AppLifecycleWidget(
          child: ModalStyleWidget(
            child: MaterialApp(
              builder: BotToastInit(),
              title: 'Flutter Study',
              navigatorObservers: <NavigatorObserver>[
                BotToastNavigatorObserver()
              ],
              home: GestureDetector(
                child: KeyboardRootWidget(
                  child: todayShowAd != null
                      ? (todayShowAd == true ? const IndexPage() : SplashPage())
                      : Container(
                          color: Colors.white,
                        ),
                  // child: MainIndexPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
