import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/color/colorMain.dart';
import 'package:real_estate/cubit/app_cubit.dart';
import 'package:real_estate/widget/CustomDropButton.dart';
import 'package:real_estate/widget/customTextField.dart';

class FilterHomePage extends StatelessWidget {
   FilterHomePage({Key? key}) : super(key: key);

  @override

  List<String> itemFloor=["1","2","3","4","5","6","7"," 8","9","10"];
  List<String> itemMinRoom=["1","2","3","4","5","6","7"," 8","9","10"];

  List<String> itemdirection=["شمالي","شرقي","غربي","جنوبي","شمالي شرقي","شمالي غربي","شمالي جنوبي"," غربي جنوبي","غربي شرقي",""];

  TextEditingController NameController=TextEditingController();
  TextEditingController MinePriceController=TextEditingController();
  TextEditingController MaxPriceeController=TextEditingController();
  TextEditingController MineSpaceController=TextEditingController();
  TextEditingController MaxSpaceController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Text("ابحث هنا",style: TextStyle(fontSize: 15)),
            RSizedBox(width: 10.w,),
            Icon(Icons.search)
          ],
        ),
        backgroundColor: ColorBlue,
        automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(
        child:  Container(
          padding: REdgeInsetsDirectional.only(top: 30.h,end: 20.h,start: 20.w,bottom: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("اسم المنطقة : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "",
                          // prefixIcon: Icon(Icons.accessibility_new),
                          suffix: false,
                          suffix_icon: null,
                          controller:NameController ,
                          keyboard: TextInputType.text,
                          // PasswordFoucs: NameFoucs,
                          obsc:false,
                          validate:  (value) {
                            if(value!.isEmpty)
                            {
                              // NameFoucs.requestFocus();
                              return "رجاءً إملاءه , إنه فارغ ";
                            }

                          },
                        ),
                      ],

                    ),
                  ),
                  RSizedBox(width: 10.w,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الطابق : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                          RSizedBox(height: 5.h,),
                          CustomDropButton(
                            selectItem: AppCubit.get(context).selectItemFloor,
                            itemeList:itemFloor ,
                            hint: "الطابق",
                            onChange: (value)
                            {
                              AppCubit.get(context).SelectedFilterHousesFloor(value);
                            },
                          ),
                        ],
                      )
                  ),
                ],
              ),
              RSizedBox(height: 25.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الحد الأدنى لعدد الغرف :",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomDropButton(
                          selectItem: AppCubit.get(context).selectItemMinRoom,
                          itemeList:itemMinRoom ,
                          hint: "الطابق",
                          onChange: (value)
                          {
                            AppCubit.get(context).SelectedFilterHousesMinRoom(value);
                          },
                        ),
                      ],

                    ),
                  ),
                  RSizedBox(width: 10.w,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الحدالأعلى لعدد الغرف :",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                          RSizedBox(height: 5.h,),
                          CustomDropButton(
                            selectItem:AppCubit.get(context).selectItemMaxRoom ,
                            itemeList:itemMinRoom ,
                            hint: "الطابق",
                            onChange: (value)
                            {
                              AppCubit.get(context).SelectedFilterHousesMaxRoom(value);
                            },
                          ),
                        ],
                      )
                  ),
                ],
              ),
              RSizedBox(height: 25.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الحد الأدنى للسعر  : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "",
                          // prefixIcon: Icon(Icons.accessibility_new),
                          suffix: false,
                          suffix_icon: null,
                          controller:MinePriceController ,
                          keyboard: TextInputType.text,
                          // PasswordFoucs: NameFoucs,
                          obsc:false,
                          validate:  (value) {
                            if(value!.isEmpty)
                            {
                              // NameFoucs.requestFocus();
                              return "رجاءً إملاءه , إنه فارغ ";
                            }

                          },
                        ),
                      ],

                    ),
                  ),
                  RSizedBox(width: 10.w,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الحد الأعلى للسعر : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                          RSizedBox(height: 5.h,),
                          CustomTextField(
                            readOnly: false,
                            hint_text: "",
                            // prefixIcon: Icon(Icons.accessibility_new),
                            suffix: false,
                            suffix_icon: null,
                            controller:MaxSpaceController ,
                            keyboard: TextInputType.text,
                            // PasswordFoucs: NameFoucs,
                            obsc:false,
                            validate:  (value) {
                              if(value!.isEmpty)
                              {
                                // NameFoucs.requestFocus();
                                return "رجاءً إملاءه , إنه فارغ ";
                              }

                            },
                          ),
                        ],
                      )
                  ),
                ],
              ),
              RSizedBox(height: 25.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الحد الأدنى للمساحة : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "",
                          // prefixIcon: Icon(Icons.accessibility_new),
                          suffix: false,
                          suffix_icon: null,
                          controller:MineSpaceController ,
                          keyboard: TextInputType.text,
                          // PasswordFoucs: NameFoucs,
                          obsc:false,
                          validate:  (value) {
                            if(value!.isEmpty)
                            {
                              // NameFoucs.requestFocus();
                              return "رجاءً إملاءه , إنه فارغ ";
                            }

                          },
                        ),
                      ],

                    ),
                  ),
                  RSizedBox(width: 10.w,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الحد الأعلى للمساحة : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                          RSizedBox(height: 5.h,),
                          CustomTextField(
                            readOnly: false,
                            hint_text: "",
                            // prefixIcon: Icon(Icons.accessibility_new),
                            suffix: false,
                            suffix_icon: null,
                            controller:MaxSpaceController ,
                            keyboard: TextInputType.text,
                            // PasswordFoucs: NameFoucs,
                            obsc:false,
                            validate:  (value) {
                              if(value!.isEmpty)
                              {
                                // NameFoucs.requestFocus();
                                return "رجاءً إملاءه , إنه فارغ ";
                              }

                            },
                          ),
                        ],
                      )
                  ),
                ],
              ),
              RSizedBox(height: 25.h,),
              Text("الاتجاه :  ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
              CustomDropButton(
                selectItem: AppCubit.get(context).selectItemdirection,
                itemeList:itemdirection ,
                hint: "الطابق",
                onChange:  (value) {
                  AppCubit.get(context).SelectedFilterHousesDirection(value);
                },
              ),
              RSizedBox(height: 25.h,),
              Center(
                child: MaterialButton(
                  color: ColorBlue,
                  height: 70.h,
                  minWidth: double.infinity,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  onPressed: () {
                    print(AppCubit.get(context).selectItemdirection);
                    print(NameController.text.toString());
                    AppCubit.get(context).PostDioFilterHouses(
                      location:NameController.text.toString(),
                      direction: AppCubit.get(context).selectItemdirection,
                      min_price: MinePriceController.text.toString(),
                      max_price: MaxPriceeController.text.toString(),
                      min_space: MineSpaceController.text.toString(),
                      max_space: MaxSpaceController.text.toString(),
                      operation_id: "1",
                      floor:AppCubit.get(context).selectItemFloor,
                      max_room_number: AppCubit.get(context).selectItemMaxRoom,
                      min_room_number: AppCubit.get(context).selectItemMaxRoom
                    );
                  },
                  child: Text("بحث",style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
