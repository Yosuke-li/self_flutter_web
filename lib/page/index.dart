import 'package:flutter/material.dart';
import 'package:self_utils/utils/array_helper.dart';
import 'package:self_utils/utils/screen.dart';

import '../model/Img_model.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late ScrollController controller;
  double offset = 0; //视差
  double progressOffset = 0; //滚动条进度
  int currentIndex = 0;

  // sliverAppBar 相关
  double _opacitiy = 0;

  List<ImgWidgetModel> models = <ImgWidgetModel>[];

  @override
  void initState() {
    models = datas;
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset > controller.position.viewportDimension) {
        double a =
            ((controller.offset - controller.position.viewportDimension) /
                (controller.position.viewportDimension));
        offset = a - a.floor();
        currentIndex = a.floor();
      } else {
        double headerOffset =
            controller.offset / controller.position.viewportDimension;
        _opacitiy = 1 - headerOffset;
      }
      progressOffset = double.tryParse(
          (controller.position.extentBefore /
              controller.position.viewportDimension)
              .toStringAsFixed(2))!;
      setState(() {});
    });
    setState(() {});
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _opacitiy = 1.0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        child: CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height,
              floating: false,
              pinned: true,
              forceElevated: false,
              backgroundColor: const Color(0x00ffffff),
              actions: [
                Container(
                  margin: const EdgeInsets.only(left: 100, right: 200),
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text(
                          '--  Self DataBase Pub  --',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                            fontSize: 40,
                            fontFamily: 'Avalien',
                          ),
                        ),
                      ),
                      Container(
                        width: screenUtil.adaptive(50),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Index',
                          style: TextStyle(fontSize: 40, fontFamily: 'Avalien'),
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'About',
                          style: TextStyle(fontSize: 40, fontFamily: 'Avalien'),
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'What',
                          style: TextStyle(fontSize: 40, fontFamily: 'Avalien'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('images/banner/04.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        AnimatedOpacity(
                          opacity: _opacitiy,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: const Text(
                            'Welcome To My DataBase',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Avalien',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: screenUtil.adaptive(20),
                              left: screenUtil.adaptive(450)),
                          child: AnimatedOpacity(
                            opacity: _opacitiy,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            child: const Text(
                              'from xuan',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Avalien',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        AnimatedOpacity(
                          opacity: _opacitiy,
                          duration: const Duration(seconds: 2),
                          child: Container(
                            margin:
                                const EdgeInsets.only(bottom: 10, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'up down',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Avalien',
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  ImgWidgetModel item = ArrayHelper.get(models, index)!;
                  return _ImgComponent(
                    model: item,
                    offset: currentIndex == index ? offset : 0,
                    progressOffset: progressOffset,
                    index: index,
                  );
                },
                childCount: models.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImgComponent extends StatefulWidget {
  final ImgWidgetModel model;
  final double offset;
  final int index;
  final double progressOffset;

  const _ImgComponent(
      {Key? key,
      required this.model,
      required this.index,
      required this.offset,
      required this.progressOffset})
      : super(key: key);

  @override
  State<_ImgComponent> createState() => _ImgComponentState();
}

class _ImgComponentState extends State<_ImgComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(widget.model.image),
            alignment: Alignment(0, -widget.offset),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: widget.model.child.call(widget.progressOffset, widget.index),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
