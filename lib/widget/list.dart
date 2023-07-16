import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/app_cubit.dart';
import '../jsons/housesJson.dart' ;
import '../secondry.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;

class list extends StatelessWidget {
  List<Houses> ?ListHouses;
   list({Key? key, required this.ListHouses}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // List<Houses> h=;
          return InkWell(
            onTap: () {
              print(index);
              Navigator.push(context, MaterialPageRoute(builder: (context) => second(ListHouses![index])));
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
                      (ListHouses?[index].post?.postsable?.images)!.isEmpty?
                          flutterImage.Image.asset('assets/images/empty.png', height: 200.h, width:200.w,fit: BoxFit.cover,)
                          :
                      flutterImage.Image.network('${ListHouses?[index].post?.postsable?.images[0].img}'
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
                            RSizedBox(height: 5,),
                            Text("المساحة ${ListHouses?[index].post?.postsable?.space} ",style: TextStyle(color:Colors.white,fontSize: 13.sp,fontWeight: FontWeight.bold)),
                            RSizedBox(height: 2,),
                            Text("   عدد الغرف   ${ListHouses?[index].post?.postsable?.roomNumber}    ",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold)),
                            RSizedBox(height: 2,),
                            Text("    ${ListHouses?[index].post?.postsable?.location}   ",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold)),
                            RSizedBox(height: 2,),
                          ],),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 7.h,
                      right: 10.w,
                      child:InkWell(
                        onTap: () {
                          AppCubit.get(context).ChangeIconFavorite(id: ListHouses?[index].id);
                        },
                        child:Container(
                          child: AppCubit.get(context).iconFavorite? CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 13,
                            child: RSizedBox(
                              height: 20.h,
                              width: 20.w,
                              child:   flutterImage.Image.asset('assets/images/heart.png',),
                            ),
                          ):  CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 13,
                            child: RSizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: flutterImage.Image.asset('assets/images/heart (3).png', color: Colors.white),
                            ),
                          ),
                        ) ,
                      )
                  )

                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount:ListHouses!.length ,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
