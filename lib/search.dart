import 'package:flutter/material.dart';
import 'package:real_estate/color/colorMain.dart';

class SearchHomePage extends StatelessWidget {
  const SearchHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("ابحث هنا",style: TextStyle(fontSize: 15)),
        backgroundColor: ColorBlue,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
