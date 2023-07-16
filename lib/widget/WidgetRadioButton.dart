import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/colorMain.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({Key? key, this.selectedRadio, this.onChang}) : super(key: key);
  final selectedRadio;
  final onChang;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          activeColor: ColorBlue,
          value: 0,
          groupValue: selectedRadio,
          onChanged:onChang
        ),
        Text(
          'أجار',
          style: new TextStyle(fontSize: 17.0),
        ),
        RSizedBox(width: 100.w,),
        Radio(
          value: 1,
          groupValue: selectedRadio,
          activeColor: ColorBlue,
          onChanged: onChang
        ),
        Text(
          'بيع',
          style: new TextStyle(
            fontSize: 17.0,
          ),
        ),
        RSizedBox(width: 30.w,),
      ],
    );
  }
}
