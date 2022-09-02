import 'package:flutter/material.dart';
import 'package:self_flutter_web/page/component/forth_widget.dart';
import 'package:self_flutter_web/page/component/sec_widget.dart';
import 'package:self_flutter_web/page/component/third_widget.dart';

typedef FuncWidget = Widget Function(double offset, int index);

class ImgWidgetModel {
  ImgWidgetModel(
      {required this.date,
      required this.child,
      required this.image,
      required this.name});

  String name; //名称
  FuncWidget child;
  String date;
  String image;
}

List<ImgWidgetModel> datas = <ImgWidgetModel>[
  ImgWidgetModel(
    name: '',
    child: (double offset, int index) {
      return SecWidget(
        offset: offset,
        index: index,
      );
    },
    image: 'images/banner/06.jpg',
    date: '2021-09-03',
  ),
  ImgWidgetModel(
    name: '',
    child: (double offset, int index) {
      return ThirdWidget(
        offset: offset,
        index: index,
      );
    },
    image: 'images/banner/01.jpeg',
    date: '2021-05-21',
  ),
  ImgWidgetModel(
    name: '',
    child: (double offset, int index) {
      return ForthWidget(
        offset: offset,
        index: index,
      );
    },
    image: 'images/banner/02.jpeg',
    date: '2021-05-21',
  ),
  ImgWidgetModel(
    name: '',
    child: (double offset, int index) {
      return Container();
    },
    image: 'images/banner/68.jpg',
    date: '2021-05-21',
  ),
  ImgWidgetModel(
    name: '',
    child: (double offset, int index) {
      return Container();
    },
    image: 'images/banner/63.jpg',
    date: '2021-05-21',
  ),
];
