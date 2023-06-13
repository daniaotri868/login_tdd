import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/color/colorMain.dart';
import 'package:real_estate/login.dart';
import 'package:real_estate/secondCar.dart';
import 'package:real_estate/start.dart';
//istockphoto-949098320-612x612.jpg
// istockphoto-1068442770-612x612.jpg
// istockphoto-1163584107-612x612.jpg
// adrian-dascal-eFq8xS1wJwM-unsplash.jpg
// martin-katler-r_7Innuzja8-unsplash.jpg
// wassim-chouak-FKtiEiMK1mQ-unsplash.jpg
class Welcom extends StatefulWidget {
   Welcom({Key? key}) : super(key: key);

  @override
  State<Welcom> createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  List item=['assets/images/Vector.png','assets/images/Vector2.png','assets/images/Vector3.png'];
  List itemText1=['اختر المكان المناسب لك...','في الموقع الذي تفضله','و بسرعة قصوى'];
  List itemText2=['ابحث عن ميزات بيت أحلامك و ستجدها ','اختر المكان بأدق تفاصيله','خلال وقت قصير ستجد بيت أحلامك'];


  int Dotsindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: REdgeInsetsDirectional.all(10),
        child: Column(
          children: [
          RSizedBox(height: 70,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // RSizedBox(width: 30,),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
                  },
                  child: Text("تخطي",style: TextStyle(color: ColorBlue)),
                ),
                RSizedBox(width: 265,),

              ],
            ),
            RSizedBox(height: 100,),
            CarouselSlider(
              items: item.map((e) {
                return Container(
                  height:100.h ,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(e),fit: BoxFit.contain,)
                  ),

                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1,
                viewportFraction: 1,

                scrollPhysics: const FixedExtentScrollPhysics(),
                  onPageChanged: (index, reason) {
                  setState(() {
                    Dotsindex=index;
                  });
                  },
              ),


            ),

          Text("${itemText1[Dotsindex]}",style: TextStyle(fontSize: 22.sp)),
          Text("${itemText2[Dotsindex]}",style: TextStyle(color: Colors.grey,fontSize: 20.sp)),
          RSizedBox(height: 20),
            DotsIndicator(
              dotsCount: 3,
              position: Dotsindex,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: ColorBlue,
                size: Size(12.h, 12.w),
                activeSize: Size(12.h, 30.w),
                spacing: EdgeInsets.all(1),
              ),

            ),
             Row(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 MaterialButton(
                   onPressed:() {
                     setState(() {
                       Dotsindex==2?Dotsindex=0:Dotsindex++;
                     });
                   },

                   child: Container(
                     decoration: BoxDecoration(
                       color: ColorBlue,
                       borderRadius: BorderRadius.circular(20.r),
                     ),
                     width: 50.w,
                     height: 50.h,
                     child: const Center(
                       child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 17),
                     ),
                   ),
                 )
               ],
             ),
               // Row(
               //  crossAxisAlignment: CrossAxisAlignment.start,
               //   children: [
               //     InkWell(
               //        child:  Container(
               //          margin: EdgeInsets.all(10),
               //            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
               //            decoration: BoxDecoration(
               //              borderRadius: BorderRadius.circular(10)
               //                ,color: ColorBlue
               //            ),
               //            height: 60.h,width:60.w,child:
               //                Center(child: Icon(Icons.arrow_back,size: 22,color: Colors.white)),
               //
               //        ),
               //       onTap:  () {
               //        setState(() {
               //          Dotsindex==2?Dotsindex=0:Dotsindex++;
               //        });
               //        },
               //      ),
               //   ],
               // ),

          // ,TextButton(
          //         onPressed: () {
          //          Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen(),));
          //         },
          //         child: Text("تخطي"),
          //       ),


            Spacer(),

            // Positioned(
            //   top:MediaQuery.of(context).size.height/13,
            //      right: MediaQuery.of(context).size.width/4,
            //     child: Text("اختر  عقار أحلامك",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),))25
          ],
        ),
      ),
    );
  }
}
