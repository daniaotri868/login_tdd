import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../jsons/getUserJson.dart';
import '../jsons/housesJson.dart';
import 'cash_helper.dart';
import 'dio_factory.dart';


class AuthRepo {
  late final Dio _dio;
  AuthRepo() {
    _dio = DioFactory.instance.get();
  }

  Future<Either<String, String>> loginUser(
      {required String email, required String password}) async {
    try {
      final result = await _dio
          .post('login?email=$email&password=$password');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data["access_token"]);
      print("SuccessfulData");
      print("hhhhhhhhhher${result.data["access_token"]}");
      print("Chace = ${CachHelper.sharedPreferences.getString('token')}");
      return Right(result.data["access_token"]);

    } catch (error) {
      print("error =$error");
      return Left("error");
      // return Left(ExceptionHandler.handle(error as Exception));
    }
  }
//
  Future<Either<String, String>> createUser(
      {
        required String name,
        required String email,
        required String password,
        required String password_confirmation,
        String ?phone,
        String ?image
      }) async {
    try {
      final result = await _dio.post(
        'register?name=$name&email=$email&password=$password&password_confirmation=$password_confirmation&img=$image&phone=$phone',
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data["access_token"]);
      await prefs.setInt('id', result.data["user"]["id"]);
      print("hhhhhhhhhher${result.data["access_token"]}");
      print("Chace = ${CachHelper.sharedPreferences.getString('token')}");
      print("Chace id  = ${CachHelper.sharedPreferences.getInt('id')}");
      print("SuccessfulData");
      return Right(result.data["access_token"]);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }

  // String json = jsonEncode(house.toJson());

  Future<Either<String, List<Houses>>> showHouses() async {
    try {
      final result = await _dio.get('posts');
      // housesFromJson("${result.data}");
      print("SuccessfulData");
      print("hhhhhhhhhher${result.data}");
      // List<dynamic> jsonResponse = json.decode(result.data.toString());
      // List<Houses> housesList = [];
      // jsonResponse.forEach((houseJson) {
      //   Houses house = Houses.fromJson(houseJson);
      //   housesList.add(house);
      // });
      //
      (result.data as List).map((e) {
        return Houses.fromJson(e);
      }).toList();
      print("SuccessfulDataHome");
      return Right((result.data as List).map((e) {
        return Houses.fromJson(e);
      }).toList());


    } catch (error) {
      print("error =$error");
      return Left("jgkg");
      // return Left(ExceptionHandler.handle(error as Exception));
    }
  }


  Future<Either<String, List<GetUser>>> getProfile() async {
    try {
      final result = await _dio.get('/users/${CachHelper.sharedPreferences.getInt('id')}');
      print("SuccessfulData");
      print("hhhhhhhhhher${result.data}");

      List<dynamic> data = result.data;
      List<GetUser> userList = List.from(data.map((userJson) => GetUser.fromJson(userJson as Map<String, dynamic>)));
      print("SuccessfulShowUser");
      return Right(userList);

    } catch (error) {
      print("error =$error");
      return Left("jgkg");
    }
  }


  Future<Either<String, String>> PostHouses(
      {
        required String location,
        required String direction,
        required String floor,
        required String space,
        required String room_number,
        required String price,
        required String images,
        required String operation_id,
        required String duration,


      }) async {
    try {
      _dio.options.followRedirects = true;
      final result = await _dio.post(
        'houses/add',
        data: {
          'location':'$location',
          'direction':'$direction',
          'floor':'$floor',
          'space':'$space',
          'room_number':room_number,
          'price':price,
          'images':images,
          'operation_id':operation_id,
          'duration':'$direction',
        },
        options: Options(
            followRedirects: false,
          validateStatus: (_) => true,
      ),
      );
      // result.

      print("SuccessfulData posttttt");
      print(result.data);
      return Right(result.data);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }

//   Future<Either<String, ProfileModel>> myProfile() async {
//     try {
//       final result = await _dio.get(
//         'Mobile/Customer/GetMyProfile',
//       );
//       print("SuccessfulData");
//       return Right(ProfileModel.fromJson(result.data["response"]));
//     } catch (error) {
//       print("error =$error");
//       return Left(ExceptionHandler.handle(error as Exception));
//     }
//   }
//
//   Future<Either<String, List<HomeModel>>> getHome() async {
//     try {
//       final result = await _dio.get('Mobile/Home/Get');
//       (result.data["response"] as List).map((e) {
//         return HomeModel.fromJson(e);
//       }).toList();
//       print("SuccessfulDataHome");
//       return Right((result.data["response"] as List).map((e) {
//         return HomeModel.fromJson(e);
//       }).toList());
//     } catch (error) {
//       print("error =$error");
//       return Left(ExceptionHandler.handle(error as Exception));
//     }
//   }
// }

// Future<Either<String, List<HomeModel>>> getHome() async {
//   try {
//     final result = await _dio.get('Mobile/Home/Get');
//     (result.data['response'] as List).map((e) {
//       return HomeModel.fromJson(e);
//     }).toList();
//     print("SuccessfulDataHome");
//     return Right((result.data['response'] as List).map((e) {
//       return HomeModel.fromJson(e);
//     }).toList());
//   } catch (error) {
//     print("error =$error");
//     return Left(ExceptionHandler.handle(error as Exception));
//   }
}

