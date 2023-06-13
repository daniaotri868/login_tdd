import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/cubit/app_cubit.dart';

import 'color/colorMain.dart';

class loginScreen extends StatelessWidget {
   loginScreen({Key? key}) : super(key: key);
final fromKey=GlobalKey<FormState>();
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
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
                    backgroundColor: Colors.blue[100],
                    radius: 50,
                    child: Image.asset('assets/images/boy.png',fit: BoxFit.fill,height: 70,width: 70),
                  ),
                  SizedBox(height: 10,),
                  Text("تسجيل الدخول ",style: TextStyle(fontSize: 25)),
                  SizedBox(height: 100,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode:emailFoucs ,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "الايميل",
                      //hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue.shade50)
                      ),

                    ),
                    validator: (value) {
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
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: PasswordFoucs,
                    controller: passwordController,
                    obscureText: AppCubit.get(context).visib,
                    decoration: InputDecoration(
                      hintText: "كلمة السر",
                      //hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(AppCubit.get(context).visib==true?Icons.visibility_off:Icons.visibility,color: Colors.blue[300],),
                        onPressed: () {
                         AppCubit.get(context).ChangeIconVisib();
                        },

                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue)
                      ),

                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                        {
                          PasswordFoucs.requestFocus();
                          return "رجاءً إملاءه , أنه فارغ";
                        }
                      if(value.length<6)
                        {
                          PasswordFoucs.requestFocus();
                          return "لا يسمح بأقل من 6 محارف";
                        }
                    },
                  ),
                  SizedBox(height: 30,),
                  TextButton(
                    onPressed: () {
                    if(fromKey.currentState!.validate())
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم")));
                      }
                    },

                    child: Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFF1E88E5).withOpacity(0.6)
                      ),
                      height: 50,
                      width: double.infinity,

                      child: Center(child: Text("تسجيل",style: TextStyle(color: Colors.black87),)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("هل نسيت كلمة السر؟!"),
                      TextButton(onPressed: () {

                      }, child: Text("اضغط هنا",style: TextStyle(color: Color(0xffFF1E88E5).withOpacity(0.9)),)),
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
