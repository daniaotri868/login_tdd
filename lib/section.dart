import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/color/colorMain.dart';
import 'package:real_estate/cubit/app_cubit.dart';
import 'package:real_estate/secondry.dart';

class section extends StatefulWidget {
  const section({Key? key}) : super(key: key);

  @override
  State<section> createState() => _sectionState();
}

class _sectionState extends State<section> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 100.h,
              title: SizedBox(
                height: 70.h,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF2F7FF)
                  ),
                  child: TextField(
                      cursorColor: Colors.white,

                      decoration:InputDecoration(
                        filled: false,
                        fillColor: Color(0xffDEEAFD),

                        hintText: "ابحث هنا",
                        hintStyle: TextStyle(fontFamily: 'Vollkorn',color: Colors.black54,fontSize: 17.sp),
                        prefixIcon:  Icon(Icons.search,color: Color(0xffFFBDBDBD)),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffDEEAFD))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffDEEAFD))
                        ),
                      )
                  ),
                ),
              ),
                  actions:const [  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.png'),
              radius: 25,
            ),
                  ),]

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, index) =>Padding(
                  padding: REdgeInsetsDirectional.only(start: 6,top: 20),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: (AppCubit.get(context).houses[index]['images']).isEmpty?
                        Image.asset('assets/images/empty.png',width: 150.w,height:160.h,fit: BoxFit.cover,)
                            :
                        Image.network('${AppCubit.get(context).houses[index]['images'][0]['img']}'
                          ,width: 150.w,height:160.h,fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),

                        //child: Image.asset('assets/images/mainhouse.jpg',fit: BoxFit.fitHeight)),
                      ),

                      // ClipRRect(
                      //   borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),
                      //   child: Image.asset('assets/images/mainhouse.jpg',
                      //     width: MediaQuery.of(context).size.width/2,height: 200,fit: BoxFit.cover,),
                      // ),
                      Padding(
                        padding: REdgeInsetsDirectional.only(start: 20),
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [

                            Text("الموقع  الفرقان جانب مدرسة .. ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis )),
                            Text("السعر 150 مليون ل.س", style: TextStyle(fontSize: 18.sp)),
                            Text("تاريخ النشر 20/12/2023",style: TextStyle(color: Colors.grey)),
                            //RSizedBox(height: 5,),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => second(index)));
                                },
                                child: Text("للمزيد من التفاصيل...",style: TextStyle(color: MainDark,fontSize: 15.sp),


                                )
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ) ,
                separatorBuilder: (context, index) =>SizedBox(height: 10) ,
                itemCount: 5),
          ),
        );
      },
    );
  }
}
