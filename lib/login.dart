import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/createUser.dart';
import 'package:real_estate/cubit/app_cubit.dart';
import 'package:real_estate/widget/customTextField.dart';

import 'color/colorMain.dart';

class loginScreen extends StatelessWidget {
   loginScreen({Key? key}) : super(key: key);
final fromKey=GlobalKey<FormState>();
   TextEditingController emailController=TextEditingController(text: "");
   TextEditingController passwordController=TextEditingController(text: "");
final PasswordFoucs=FocusNode();
final emailFoucs=FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: ColorbackgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: fromKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorBlue,
                    radius: 50,
                    child: Image.asset('assets/images/boy.png',fit: BoxFit.fill,height: 70,width: 70),
                  ),
                  SizedBox(height: 10,),
                  Text("تسجيل الدخول ",style: TextStyle(fontSize: 25)),
                  SizedBox(height: 100,),
                  CustomTextField(
                      hint_text: "الايميل",
                      readOnly: false,
                      line: 1,
                      suffix: false,
                      suffix_icon: null,
                      controller:emailController ,
                      keyboard: TextInputType.emailAddress ,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          emailFoucs.requestFocus();
                          return "رجاءً إملاءه , أنه فارغ";
                        }
                        // if(value.length<6)
                        // {
                        //   emailFoucs.requestFocus();
                        //   return "لا يسمح بأقل من 6 محارف";
                        // }
                      },
                      obsc: false,
                      focusNode:emailFoucs ,
                      prefixIcon: Icon(Icons.email,color: Colors.grey),
                  ),
                  SizedBox(height: 30,),
                  CustomTextField(
                    hint_text: "كلمة السر",
                    readOnly: false,
                    line: 1,
                    suffix: true,
                    suffix_icon: IconButton(
                      icon: Icon(AppCubit.get(context).visib==true?Icons.visibility_off:Icons.visibility,color: ColorBlue,),
                      onPressed: () {
                        AppCubit.get(context).ChangeIconVisib();
                      },

                    ),
                    controller:passwordController ,
                    keyboard: TextInputType.visiblePassword,
                    validate: (value) {
                      if(value!.isEmpty)
                      {
                        emailFoucs.requestFocus();
                        return "رجاءً إملاءه , أنه فارغ";
                      }
                      if(value.length<6)
                      {
                        emailFoucs.requestFocus();
                        return "لا يسمح بأقل من 6 محارف";
                      }
                    },
                    obsc: AppCubit.get(context).visib,
                    focusNode:PasswordFoucs ,
                    prefixIcon: Icon(Icons.lock,color: Colors.grey),
                  ),
                  SizedBox(height: 30,),
                  state is AppLoadingPostLogin?
                    Center(
                            child: Container(height: 100.h,child: Center(child: CircularProgressIndicator(color: ColorBlue,))),
                          )
                  :TextButton(
                    onPressed: () {
                     print("hhhhhhhhhhhhhher");
                     print(emailController.text.toString());
                     print(passwordController.text.toString());

                    if(fromKey.currentState!.validate())
                      {

                        AppCubit.get(context).loginDio(context: context,email:emailController.text.toString(),password: passwordController.text.toString() );

                      }
                    },

                    child: Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorBlue
                      ),
                      height: 50,
                      width: double.infinity,

                      child: Center(child: Text("تسجيل",style: TextStyle(color: Colors.white),)),
                    ),
                  )


                  ,SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("لم تنشأ حساب ؟!"),
                      TextButton(onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const createUser(),));
                      }, child: Text("اضغط هنا",style: TextStyle(color: ColorBlue),)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
