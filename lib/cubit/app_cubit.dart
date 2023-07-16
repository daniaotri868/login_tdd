import 'dart:convert';
import 'dart:io';
// import 'dart:js';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:real_estate/jsons/getUserJson.dart';
import 'package:real_estate/start.dart';
import 'package:sqflite/sqflite.dart';

import '../jsons/housesJson.dart';
import '../token/auth_repo.dart';
part 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  late final AuthRepo _authRepo;
  AppCubit() : super(AppInitial()) {
    _authRepo = AuthRepo();
  }
 static AppCubit get(context)=>BlocProvider.of(context);
 bool iconFavorite=false;
 int currentIndex=0;
 bool visib=true;
 bool visib2=true;
 List houses=[];
 Map<String, dynamic>  Login={};
 Map<String, dynamic>  CreateUser={};
 Map<String, dynamic>  FilterHouses={};
 int x=0;
 int y=0;
 int z=0;
 int loadingImageHouses=0;
 int loadingImageCars=0;
 int loadingImageLands=0;
  late Database database;
  bool x1=false;
  bool x2=true;
  bool x3=true;
  List<Map> listNote=[];
  List <Map>Search=[];
  late int id;
  bool SearchOrNo=false;
  bool SquareShow=false;
  bool IconCheck= false;
  int selectedRadioHouses=1;
  int selectedRadioCars=1;
  int selectedRadioLands=1;
  String selectItemdirection="شمالي";
  String selectItemFloor="1";
  String selectItemMinRoom="1";
  String selectItemMaxRoom="1";
  late List<String>  base64Images;
  List<GetUser> listUser=[];
  List<Houses> listHouses=[];


  void SelectedFilterHousesFloor(value)
  {
    selectItemdirection=value;
    emit(AppChangSelectFilterHousesFloor());
  }


  void SelectedFilterHousesMinRoom(value)
  {
    selectItemMinRoom=value;
    emit(AppChangSelectFilterHousesMinRoom());
  }

  void SelectedFilterHousesMaxRoom(value)
  {
    selectItemMaxRoom=value;
    emit(AppChangSelectFilterHousesMaxRoom());
  }

  void SelectedFilterHousesDirection(value)
  {
    selectItemdirection=value;
    emit(AppChangSelectFilterHousesdirection());
  }

  void FunctionSelectedValHouses(value)
  {
    selectedRadioHouses=value;
    emit(AppChangSelectRadioButtonHouses());
  }
  void FunctionSelectedValCars(value)
  {
    selectedRadioCars=value;
    emit(AppChangSelectRadioButtonCars());
  }
  void FunctionSelectedValLands(value)
  {
    selectedRadioLands=value;
    emit(AppChangSelectRadioButtonLands());
  }
  void ChangeIconFavorite({ id})
 {
   if(iconFavorite==false) {
     iconFavorite=true;
   } else {
     iconFavorite=false;
   }
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

  void ChangeIconVisib2()
  {
    if(visib2==true)
      visib2=false;
    else
      visib2=true;
    emit(AppChangIconVisib2());
  }


  final ImagePicker _picker = ImagePicker();
  File? photo;
  List<File?> ?Listphoto;

  List<File> selectedImagesHouses = []; // List of selected image
  List<File> selectedImagesCars = []; // List of selected image
  List<File> selectedImagesLands = []; // List of selected image
  final picker = ImagePicker();

  Future imgFromGallery() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      photo = File(pickedFile.path);

    } else {
      print('No image selected.');
    }
    emit(AppImageCreateUser());
  }
  Future imgFromCamera() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      photo = File(pickedFile.path);

    } else {
      print('No image selected.');
    }
    emit(AppImageCreateUser());
  }
  List<String> convertFilesToBase64(List<File> files) {
    List<String> base64List = [];
    for (var file in files) {
      List<int> bytes = file.readAsBytesSync();
      String base64Image = base64Encode(bytes);
      base64List.add(base64Image);
    }
    return base64List;
  }
  Future<void> getImagesHouses({required BuildContext context}) async {
    loadingImageHouses = 1;
    emit(AppListImageLoadingPostHouses());
    selectedImagesHouses = [];
    final pickedFile = await _picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesHouses.add(File(xfilePick[i].path));
      }
       base64Images = convertFilesToBase64(selectedImagesHouses);
      // ...
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nothing is selected')),
      );
    }
    loadingImageHouses = 0;
    emit(AppListImageAddPostHouses());
  }

  Future getImagesCars({required context}) async {
    loadingImageCars=1;
    emit(AppListImageLoadingPostCars());
    selectedImagesCars = [];
    final pickedFile = await _picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesCars.add(File(xfilePick[i].path));
      }

    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context ).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')));
    }
    loadingImageCars=0;
    emit(AppListImageAddPostCars());
  }

  Future getImagesLands({required context}) async {
    loadingImageLands=1;
    emit(AppListImageLoadingPostLands());
    selectedImagesLands = [];
    final pickedFile = await _picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesLands.add(File(xfilePick[i].path));
      }

    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')));
    }
    loadingImageLands=0;
    emit(AppListImageAddPostLands());
  }


  // void getDio({required String url})
  // async {
  //   emit(AppLoadingGetHouses());
  //   if(houses.length==0)
  //     {
  //       Dio(BaseOptions(receiveTimeout: Duration(seconds:  6),connectTimeout: Duration(seconds: 7),))
  //           .get('https://real-estates-test.000webhostapp.com/public/api/houses').then((value) {
  //         emit(AppSuccessfulGetHouses());
  //         print("Succesfal data");
  //         houses=value.data;
  //         print(houses);
  //
  //       }).catchError((error){
  //         emit(AppErrorGetHouses());
  //         print("error =$error");
  //       }) ;
  //     }else
  //       {
  //         emit(AppSuccessfulGetHouses());
  //       }
  // }

  void loginDio({required String email, required String password,required context}) async {
    emit(AppLoadingPostLogin());
    Either<String, String> result =
    await _authRepo.loginUser(email: email, password: password);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));

      emit(AppErrorPostLogin());
      print("sucsessful");
      //show error
    }, (r) {
      emit(AppSuccessfulPostLogin());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
      print("Error");

      //save user
    });
  }


  void HousePostDio({required String location,
    required String direction,
    required String floor,
    required String space,
    required String room_number,
    required String price,
    required String images,
    required String operation_id,
    required String duration,
    required context
  }) async {
    emit(AppLoadingPostHouses());
    Either<String, String> result =
    await _authRepo.PostHouses(
        location: location,
        direction: direction,
        floor: floor,
        space: space,
        room_number: room_number,
        price: price,
        images: images,
        operation_id: operation_id,
        duration: duration
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));

      emit(AppErrorPostHouses());
      print("Error");

      //show error
    }, (r) {
      emit(AppSuccessfulPostHouses());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      print("sucsessful pppppost");

      //save user
    });
  }


  void showHousesDio() async {
    emit(AppLoadingGetHouses());
    Either<String, List<Houses>> result =
    await _authRepo.showHouses();
    result.fold((l) {
      emit(AppErrorGetHouses());
      print("Error");
      //show error
    }, (r) {
      listHouses?.addAll(r);
      emit(AppSuccessfulGetHouses(r as List<Houses>));
      print("sucsessful");


      //save user
    });
  }

  void showUser() async {
    emit(AppLoadingGetUser());
    Either<String, List<GetUser>> result = await _authRepo.getProfile();
    result.fold((l) {
      emit(AppErrorGetUser());
      print("Error= $l");
    }, (r) {
      listUser?.addAll(r);
      print("${listUser}");
      print("rrrrrrrrrrr=${r as List<GetUser>}");
      emit(AppSuccessfulGetUser(r));
      print("Successful");
    });
  }

  void CreateDio({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required context,
    String ?phone,
    String ?image}) async {
    emit(AppLoadingPostCreateUser());
    Either<String, String> result =
    await _authRepo.createUser(
        name: name,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        phone: phone,
        image: image
    );
    result.fold((l) {
      emit(AppErrorPostCreateUser());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));
      print("Error");
      //show error
    }, (r) {
      emit(AppSuccessfulPostCreateUser());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
      print("sucsessful");

      //save user
    });
  }
  void PostDioLogin({required String email,required String password})
  async {
    y=1;
    emit(AppLoadingPostLogin());

      Dio(BaseOptions(receiveTimeout: Duration(seconds:  6),connectTimeout: Duration(seconds: 7),))
          .post('https://real-estates-test.000webhostapp.com/public/api/login?email=$email&password=$password').then((value) {
            y=0;
        emit(AppSuccessfulPostLogin());
        print("Succesfal data");
        Login=value.data;
        print(Login);
        print(value.data['access_token']['token']);
      }).catchError((error){
        y=0;
        emit(AppErrorPostLogin());
        print("error =$error");
      }) ;

  }


  void PostDioCreateUser(
      {
      required String name,
      required String email,
      required String password,
      required String password_confirmation,
      String ?phone,
      String ?image
      })
  async {
    x=1;
    emit(AppLoadingPostCreateUser());
    Dio(BaseOptions(receiveTimeout: const Duration(seconds: 6),connectTimeout: const Duration(seconds: 7),))
        .post('https://real-estates-test.000webhostapp.com/public/api/users/add?name=$name&email=$email&phone=$phone&password=$password&img=$image')
        .then((value) {
          x=0;
      emit(AppSuccessfulPostCreateUser());
      print("Successfal Create User");
      CreateUser=value.data;
      print(CreateUser);
      print(value.statusCode);
    }).catchError((error){
      x=0;
      emit(AppErrorPostCreateUser());
      print("error in Create User =$error");
    }) ;

  }


  void PostDioEditeUser(
      {required String name,
        required String email,
        required String password,
        String ?phone,
        String ?image})
  async {
    z=1;
    emit(AppLoadingPostEditeUser());
    Dio(BaseOptions(receiveTimeout: const Duration(seconds: 6),connectTimeout: const Duration(seconds: 7),))
        .post(
        'https://real-estates-test.000webhostapp.com/public/api/users/edit/1?name=$name&email=$email&phone=$email&password=$password&img=$image')
        .then((value) {
      z=0;
      emit(AppSuccessfulPostEditeUser());
      print("Successfal Edite User");
      print(value.data);
      print(value.statusCode);
    }).catchError((error){
      z=0;
      emit(AppErrorPostEditeUser());
      print("error in Create User =$error");
    }) ;

  }



  void PostDioFilterHouses(
      {required String location,
        required String min_space,
        required String max_space,
        required String direction,
        required String floor,
        required String min_room_number,
        required String max_room_number,
        required String min_price,
        required String max_price,
        required String operation_id


      })
  async {
    x=1;
    emit(AppLoadingFilterHouses ());
    Dio(BaseOptions(receiveTimeout: const Duration(seconds: 6),connectTimeout: const Duration(seconds: 7),))
        .post(
        'http://real-estates-test.000webhostapp.com/public/api/posts/filter/houses?location=Aleppo&min_space=200&max_space=2000&direction=west&floor=2&min_room_number=3&max_room_number=3&min_price=300&max_price=2000&operation_id=1')
        .then((value) {
      x=0;
      emit(AppSuccessfulFilterHouses ());
      print("Successfal Filter");
      FilterHouses=value.data;
      print(FilterHouses);
      print(value.statusCode);
    }).catchError((error){
      x=0;
      emit(AppErrorPostFilterHouses());
      print("error in Create User =$error");
    }) ;

  }






  void CreateDataBase()
  {
    openDatabase(
      'data.db',
      version: 1,
      onCreate: (database, version) {
        database.execute('CREATE TABLE note(id INTEGER PRIMARY KEY, INTEGER idx)').then((value) {
          print("create Table Successful");
        }).catchError((error){print(" Error : Not Create Table");});
      },
      onOpen: (database) {
        getDataBase(database).then((value) {

          emit(AppGetDataBase());
        });
        print("DataBase Successful ");
      }


      ,

    ).then((value) {
      database=value;
      emit(AppCreateDataBase());
    });
  }

  Future<List<Map>> getDataBase(Database database)async
  {
    emit(AppLoadingGetDataBase());
    print("in get Data");
    return  await database.rawQuery('select * from note');
  }
  Future insertDataBase({idx})
  {
    print("in insert Data");
    return  database.transaction((txn)async {
      txn.rawInsert('insert into note (idx) values ("$idx")')
          .then((value){
        emit(AppInsertDataBase());
        print("value =$value");
        id=value;
        getDataBase(database).then((value) {
          listNote=value;
          print(listNote);
          emit(AppGetDataBase());
        });
      }
      ).catchError((error){print("error in insert");});
    });
  }

  Future updateDataBase({idx, id})async
  {
    emit(AppGetDataBase());
    print("id = $id");
    print("in update");
    return await database.rawUpdate('UPDATE note SET idx = "$idx" WHERE id = ${id}',)
        .then((value) {

      print("update successful");
      getDataBase(database).then((value) {
        emit(AppUpdateDataBase());
        listNote=value;
        print(listNote[id]);
        emit(AppGetDataBase());
      });

    }).catchError((error){
      print("error in update");

    }

    );

  }

  DeleteDataBase({id})async
  {
    print("in delete");
    return await database.rawDelete('DELETE FROM note WHERE id = $id').then((value) {
      emit(AppDeleteDataBase());
      print("delete successful");
      getDataBase(database).then((value) {
        listNote=value;
        print(listNote);
        emit(AppGetDataBase());
      });
    }).catchError((error){print("error in delete");});
  }

  DeleteAll()async
  {
    print("in delete All ");
    return await database.rawDelete('DELETE FROM note ').then((value) {
      emit(AppDeleteDataBase());
      print("delete successful All ");
      getDataBase(database).then((value) {
        listNote=value;
        print(listNote);
        emit(AppGetDataBase());
      });
    }).catchError((error){print("error in delete All ");});

  }


  void functionSearch({ required value,required context})
  {

    Search=[];
    if(value.isNotEmpty)
    {
      SearchOrNo=true;
      // houses.forEach((element) {
      //   var x=element;
      //   print("element = \n $element");
      //   print(element);
      //   if(element.contains(value))
      //   {
      //     Search.add(element);
      //   }
      // });
      print( "Search \n = $Search");

    }
    else
    {
      SearchOrNo=false;
    }
    emit(AppSearch());

  }

}







