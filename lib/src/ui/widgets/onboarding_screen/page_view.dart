import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> showPageViewModel(BuildContext context) {
  PageDecoration pageDecoration(Color colorPage) {
    return PageDecoration(
      imagePadding: const EdgeInsets.all(40),
      pageColor: colorPage,
      titleTextStyle: TextStyle(
        color: colorPallete.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Righteous',
        fontSize: sizes.width(context) / 11,
        letterSpacing: 1.5,
      ),
    );
  }

  final pageViewModel = [
    PageViewModel(
      decoration: pageDecoration(colorPallete.ob1Color),
      title: 'Tampilan Menarik',
      body: '',
      image: ShowImageAsset(
        imageUrl: 'asset/images/OB-1.png',
      ),
    ),
    PageViewModel(
      decoration: pageDecoration(colorPallete.ob2Color),
      title: 'Fitur Menarik',
      body: '',
      image: ShowImageAsset(
        imageUrl: 'asset/images/OB-2.png',
      ),
    ),
    PageViewModel(
      decoration: pageDecoration(colorPallete.ob3Color),
      // title: 'Ingat Utangmu',
      title: 'Ingat Utangmu \n \n #BayarUtang',
      body: '',
      image: ShowImageAsset(
        imageUrl: 'asset/images/OB-3.png',
      ),
    ),
  ];
  return pageViewModel;
}
