part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppChangeIconFavorite extends AppState {}
class AppChangCurrentIndex extends AppState {}
class AppChangIconVisib extends AppState {}
class AppLoadingGetHouses extends AppState {}
class AppSuccessfulGetHouses extends AppState {}
class AppErrorGetHouses extends AppState {}

