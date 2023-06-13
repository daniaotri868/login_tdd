import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
 static AppCubit get(context)=>BlocProvider.of(context);
 bool iconFavorite=false;
 int currentIndex=0;
 bool visib=true;
 List houses=[];
 void ChangeIconFavorite()
 {
   if(iconFavorite==false)
     iconFavorite=true;
   else
     iconFavorite=false;
   emit(AppChangeIconFavorite());
 }

 void changCurrentIndex(index)
 {
   currentIndex=index;
   emit(AppChangCurrentIndex());
 }

 void ChangeIconVisib()
 {
   if(visib==true)
     visib=false;
   else
     visib=true;
   emit(AppChangIconVisib());
 }


  void getDio({required String url})
  async {
    emit(AppLoadingGetHouses());
    if(houses.length==0)
      {
        Dio(BaseOptions(receiveTimeout: Duration(seconds:  6),connectTimeout: Duration(seconds: 7),))
            .get('https://real-estates-test.000webhostapp.com/public/api/houses').then((value) {
          emit(AppSuccessfulGetHouses());
          print("Succesfal data");
          houses=value.data;
          print(houses);

        }).catchError((error){
          emit(AppErrorGetHouses());
          print("error =$error");
        }) ;
      }else
        {
          emit(AppSuccessfulGetHouses());
        }
   



  }

}


