import 'package:flutter/material.dart';
import 'package:self_flutter_web/page/component/stack_img_widget.dart';
import 'package:self_flutter_web/page/slide_image/movie.dart';
import 'package:self_utils/utils/array_helper.dart';
import 'package:self_utils/utils/screen.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late ScrollController controller;

  // PageController scrollController = PageController();
  double offset = 0;
  int currentIndex = 0;

  List<Movie> movies = <Movie>[
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/06.jpg',
      date: '2021-09-03',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/01.jpeg',
      date: '2021-05-21',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/02.jpeg',
      date: '2021-05-21',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/11.jpg',
      date: '2021-05-21',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/10.jpg',
      date: '2021-05-21',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/68.jpg',
      date: '2021-05-21',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/55.png',
      date: '2021-05-21',
    ),
    Movie(
      name: '',
      desc: '',
      image: 'images/banner/63.jpg',
      date: '2021-05-21',
    ),
  ];

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset > controller.position.viewportDimension) {
        double a =
            ((controller.offset - controller.position.viewportDimension) /
                (controller.position.viewportDimension));
        setState(() {
          offset = a - a.floor();
          currentIndex = a.floor();
        });
      }
    });
    super.initState();
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
                background: Image.asset(
                  'images/banner/04.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Movie item = ArrayHelper.get(movies, index)!;
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: ExactAssetImage(item.image),
                      alignment:
                          Alignment(0, currentIndex == index ? -offset : 0),
                      fit: BoxFit.cover,
                    )),
                    height: MediaQuery.of(context).size.height,
                    child: Text('$index'),
                  );
                },
                childCount: movies.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
