import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/app_cubit.dart';
import '../secondry.dart';

class list extends StatelessWidget {
  const list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200.h,

      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            print(index);
            Navigator.push(context, MaterialPageRoute(builder: (context) => second(index)));
          },
          child: Container(
            width: 200.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color:Colors.transparent,

            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(25) ,topRight:Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25) ),
                    child:
                    (AppCubit.get(context).houses[index]['images']).isEmpty?
                    Image.asset('assets/images/empty.png' , height: 200.h, width:200.w,fit: BoxFit.cover,)
                        :
                    Image.network('${AppCubit.get(context).houses[index]['images'][0]['img']}'
                      , height: 200.h, width:200.w,fit: BoxFit.cover,
                    )
                ),
                // child: Image.asset('assets/images/mainhouse.jpg', height: 300, width:250,fit: BoxFit.cover,)),
                Positioned(
                  right: 1.w,
                  bottom: 1.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    width: 200.w,
                    child: Padding(
                      padding:REdgeInsetsDirectional.only(start: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RSizedBox(height: 2,),
                          Text("المساحة ${AppCubit.get(context).houses[index]['space']}  ",style: TextStyle(color:Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold)),
                          RSizedBox(height: 1,),
                          Text("   عدد الغرف   ${AppCubit.get(context).houses[index]['no_rooms']}    ",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold)),
                          RSizedBox(height: 1,),
                          Text("  ${AppCubit.get(context).houses[index]['location']}   ",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold)),
                          RSizedBox(height: 1,),
                        ],),
                    ),
                  ),
                ),
                Positioned(
                    top: 7.h,
                    right: 10.w,
                    child:InkWell(
                      onTap: () {
                        AppCubit.get(context).ChangeIconFavorite();
                      },
                      child:Container(
                        child: AppCubit.get(context).iconFavorite? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 13,
                      child: RSizedBox(
                        height: 20.h,
                        width: 20.w,
                        child:    Image.asset('assets/images/heart.png',),
                      ),
                    ):  CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 13,
                      child: RSizedBox(
                        height: 20.h,
                        width: 20.w,
                        child:    Image.asset('assets/images/heart (3).png', color: Colors.white),
                      ),
                    ),
                ) ,
                    )
                    )

              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: AppCubit.get(context).houses.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
