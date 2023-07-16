import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/widgetConst.dart';
import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';

class secondCar extends StatefulWidget {
  const secondCar({Key? key}) : super(key: key);

  @override
  State<secondCar> createState() => _secondCarState();
}
CarouselController carouselController=CarouselController();
int currentIndex=0;
class _secondCarState extends State<secondCar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:  SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: [1,2,3,4,5].map((e) {
                        return Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset('assets/images/maincar.png',fit: BoxFit.fitHeight)),
                        );
                      }).toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: BouncingScrollPhysics(),
                        height: MediaQuery.of(context).size.height/2.5,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex=index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      left: 1,
                      top: 25,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black54,)),
                    ),
                    Positioned(
                        top: 30,
                        right: 1,
                        child: IconButton(onPressed: () {
                          AppCubit.get(context).ChangeIconFavorite();
                        },icon:AppCubit.get(context).iconFavorite==false?Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite:Icons.favorite_sharp,color: Colors.white):Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite_border:Icons.favorite_sharp,color: Colors.red[300]),
                        )),

                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) =>  Padding(
                            padding: const EdgeInsets.all(1),
                            child: CircleAvatar(radius: 3,backgroundColor:currentIndex==index? MainDark:Colors.black38,),
                          ),)
                      ),
                      SizedBox(height: 10,),
                      Text("السعر 50 مليون سوري",style: TextStyle(color: benlight,fontSize: 19),),
                      SizedBox(height: 4,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child:Container(
                                height: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal[50],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/car (6).png',width: 30,height: 25,),
                                      SizedBox(height: 2,),
                                      Text("الاسم",style: TextStyle(fontSize: 10,color: Colors.green),),
                                      SizedBox(height: 3,),
                                      Text("لامبورغيني",style: TextStyle(fontSize:11,color: Colors.black),)
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 1,
                              child:Container(
                                height: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[50],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/plate.png',width: 30,height: 25,),
                                      SizedBox(height:2 ,),
                                      Text("الموديل ",style: TextStyle(fontSize: 10,color: Colors.blue),),
                                      SizedBox(height: 3,),
                                      Text("بلا بلا ",style: TextStyle(fontSize:13,color: Colors.black),)
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 1,
                              child:Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow[100],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/calendar (1).png',width: 30,height: 25,),
                                      SizedBox(height: 2,),
                                      Text("سنة الصنع",style: TextStyle(fontSize: 10,color: Colors.orange),),
                                      SizedBox(height: 3,),
                                      Text("2010",style: TextStyle(fontSize:13,color: Colors.black),)
                                    ],
                                  ),
                                ),
                                height: 90,

                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red[50],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/cars.png',width: 70,height: 27,),
                              SizedBox(height: 1,),
                              Text("مستعمل /  جديد",style: TextStyle(fontSize: 10,color: Colors.red),),
                              SizedBox(height: 2,),
                              Text("مستعمل",style: TextStyle(fontSize:12,color: Colors.black),)
                            ],
                          ),
                        ),
                        height: 75,

                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("تفاصيل أكثر:",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                        Text("المرآة اليمينية مكسورة........",style: TextStyle(color: Colors.black,fontSize: 12),),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("المالك",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[50],
                        ),
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/person.png'),
                              radius: 30,
                            ),
                            SizedBox(width: 10,),
                            Center(child: Text("دانية عطري",style: TextStyle(fontSize: 12),)),
                            SizedBox(width: MediaQuery.of(context).size.width/4,),
                            IconButton(
                                onPressed: () {
                                   calling();

                                }, icon: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: MainDark
                                ),
                                child: Icon(Icons.phone,color: Colors.white,size: 17,)
                            )),
                            IconButton(
                                onPressed: () {
                                  messege();
                                }, icon: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: MainDark
                                ),
                                child: Icon(Icons.mail,color: Colors.white,size: 17,)
                            ))
                          ],
                        ),

                      )
                    ],
                  ),
                )


              ],
            ),
          ),
        );
      },
    );
  }
}
