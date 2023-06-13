
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/cubit/app_cubit.dart';
import 'package:real_estate/search.dart';
import 'package:real_estate/secondCar.dart';
import 'package:real_estate/secondryLand.dart';
import 'package:real_estate/section.dart';
import 'package:real_estate/widget/list.dart';
import 'color/colorMain.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  int current=0;
  final List screen=[];
  final List name_navegation_item=["الأساسي","المفضلة","الإعدادت","التفاصيل"];
  final List Icon_navegation_item=[Icons.home,Icons.favorite_border,Icons.settings,Icons.details];
  final PageStorageBucket bucket =PageStorageBucket();
  bool x=false;
  Widget IconMode=Icon(Icons.dark_mode_rounded,color:IconDark,);
  final List Screen=[];
  //  static var obj;
  // Future fetchPostesUser()async
  // {
  //   var res=await http.get(Uri.parse("https://caac-185-107-80-83.eu.ngrok.io/api/houses"));
  //   print("hhhhhhhhher");
  //   if(res.statusCode==200)
  //   {
  //         obj=json.decode(res.body);
  //     print(" obj = ${obj[0]['id']}");
  //   }
  // }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xfff0f2f0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [  Padding(
          padding: REdgeInsetsDirectional.all(12),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.png'),
            radius: 25,
          ),
        ),],
        title: SizedBox(
          height: 55.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: TextField(
              cursorColor: Colors.white,

              decoration:InputDecoration(
                filled: false,
                fillColor: Colors.white,
                hintText: "ابحث هنا",
                hintStyle: TextStyle(fontFamily: 'Vollkorn',color: Colors.black54,fontSize: 17.sp),
                prefixIcon:  Icon(Icons.search,color: Color(0xffFFBDBDBD)),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
              )
            ),
          ),
        ),
      ),
      body: PageStorage(
          bucket: bucket,
          child:Padding(
            padding:  REdgeInsetsDirectional.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => section(),)),
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                              color:Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  color: Colors.white38,
                                  spreadRadius: 1
                              )
                              ]
                           ),
                            margin: REdgeInsetsDirectional.all(5),
                            height: 60.h,
                            width: 100.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/house.png',height: 25.h,width: 25.w),
                                SizedBox(width: 7.w,),
                                Text("عقارات",style: TextStyle(color: benlight),)
                              ],
                            )
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => section(),));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Colors.white38,
                                        spreadRadius: 1
                                    )
                                  ]
                              ),
                              margin: REdgeInsetsDirectional.all(5),
                              height: 60.h,
                              width: 100.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/land .png',height: 25.h,width: 20.w),
                                  SizedBox(width: 7.w,),
                                  Text("أراضي",style: TextStyle(color: benlight),)
                                ],
                              )
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => section(),));

                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Colors.white38,
                                        spreadRadius: 1,
                                    )
                                  ]
                              ),
                              margin: REdgeInsetsDirectional.all(5),
                              height: 60.h,
                              width: 100.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/carm.png',height: 20,width: 20),
                                  SizedBox(width: 7.w,),
                                  Text("سيارات",style: TextStyle(color: benlight),)
                                ],
                              )
                          ),
                        ),
                        flex: 1,
                      ),


                    ],
                  ),
                  RSizedBox(height: 20,),
                  Padding(
                    padding: REdgeInsetsDirectional.only(start: 10),
                    child: Text("البيوت الأكثر رواجاً  :",style: TextStyle(fontSize: 20.sp,color:benlight),),
                  ),
                  RSizedBox(height: 20,),
                  ConditionalBuilder(
                    condition: AppCubit.get(context).houses.isNotEmpty,
                    builder: (context) => list(),
                    fallback: (context) => Container(height: 100.h,child: Center(child: CircularProgressIndicator())),
                  ),
                  RSizedBox(height: 20,),
                  Text("الأراضي الأكثر رواجاً  :",style: TextStyle(fontSize: 20.sp,color:benlight),),
                  RSizedBox(height: 20,),
                  Container(
                    height: 200.h,

                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          print(index);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => secondryLand()));
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
                  ),
                  RSizedBox(height: 20,),
                  Text("السيارات الأكثر رواجاً  :",style: TextStyle(fontSize: 20.sp,color:benlight),),
                  RSizedBox(height: 20,),
                  Container(
                    height: 200.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          print(index);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => secondCar()));
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
                  ),
                  RSizedBox(height: 20,),
                 RSizedBox(height: 100,)


                ],
              ),
            ),
          )
      ),
      // floatingActionButton: CircleAvatar(
      //   backgroundColor: x==false?IconDark:IconLight,
      //   radius: 30,
      //
      //   child: FloatingActionButton(
      //     elevation: 2,
      //     backgroundColor:x==false? MainDark:MainLight,
      //     onPressed: () {
      //
      //     },child: Icon(Icons.add,color: x==false?IconDark:IconLight,),
      //
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 80,
        padding: EdgeInsetsDirectional.all(10),
        color: Colors.transparent,
        child: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Colors.white,
          strokeColor:Colors.black,
          //Color(0x30040307),
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Color(0xff212427),
          borderRadius: Radius.circular(20),
          opacity: 0.1,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.settings),
            ),
            CustomNavigationBarItem(
              icon: Image.asset('assets/images/heart (3).png', color: Colors.grey),
              selectedIcon: Image.asset('assets/images/heart (3).png', color: Colors.white)
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.account_circle),

            ),
          ],
          currentIndex: current,
          onTap: (index) {
            setState(() {
              current = index;
              if(index==3)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SearchHomePage() ,));
                }
            });
          },
        ),
      ),
      // BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //
      //   notchMargin: 4,
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             MaterialButton(onPressed: () {
      //               setState(() {
      //                 current=0;
      //               });
      //             },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icon_navegation_item[0],size: 20,color: current==0?x==false? FlatDark:FlatLight:Colors.black54,),
      //                   Text(name_navegation_item[0],style: TextStyle(color: current==0?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(onPressed: () {
      //               setState(() {
      //                 current=1;
      //               });
      //             },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icon_navegation_item[1],size: 20,color: current==1?x==false? FlatDark:FlatLight:Colors.black54,),
      //                   Text(name_navegation_item[1],style: TextStyle(color: current==1?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             MaterialButton(onPressed: () {
      //               setState(() {
      //                 current=2;
      //               });
      //             },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icon_navegation_item[2],size: 20,color: current==2?x==false? FlatDark:FlatLight:Colors.black54,),
      //                   Text(name_navegation_item[2],style: TextStyle(color: current==2?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(onPressed: () {
      //               setState(() {
      //                 current=3;
      //               });
      //             },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icon_navegation_item[3],size: 20,color: current==3?x==false? FlatDark:FlatLight:Colors.black54,),
      //                   Text(name_navegation_item[3],style: TextStyle(color: current==3?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //
      //       ],
      //
      //     ),
      //   ),
      // ),
    );
  },
);
  }
}
