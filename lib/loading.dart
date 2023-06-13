import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_estate/welcom.dart';

import 'color/colorMain.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  Welcom())));
    return Scaffold(
      backgroundColor: ColorBlue,
       body: Center(
         child: Container(
            child: Image.asset('assets/images/Real Estate Logo.png'),
         ),
       ),
    );
  }
}
