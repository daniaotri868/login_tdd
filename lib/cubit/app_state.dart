part of 'app_cubit.dart';

@immutable
abstract class AppState {

}

class AppInitial extends AppState {}
class AppChangeIconFavorite extends AppState {}
class AppChangCurrentIndex extends AppState {}
class AppChangIconVisib extends AppState {}


class AppLoadingGetHouses extends AppState {}
class AppSuccessfulGetHouses extends AppState {
  List<Houses> result;
  AppSuccessfulGetHouses(this.result);
}
class AppErrorGetHouses extends AppState {}



class AppLoadingGetUser extends AppState {}
class AppSuccessfulGetUser extends AppState {
  List<GetUser> result;
  AppSuccessfulGetUser(this.result);
}
class AppErrorGetUser extends AppState {}

class AppErrorPostLogin extends AppState {}
class AppSuccessfulPostLogin extends AppState {}
class AppLoadingPostLogin extends AppState {}

class AppErrorPostHouses extends AppState {}
class AppSuccessfulPostHouses extends AppState {}
class AppLoadingPostHouses extends AppState {}

class AppErrorPostCreateUser extends AppState {}
class AppSuccessfulPostCreateUser extends AppState {}
class AppLoadingPostCreateUser extends AppState {}


class AppErrorPostEditeUser extends AppState {}
class AppSuccessfulPostEditeUser extends AppState {}
class AppLoadingPostEditeUser extends AppState {}


class AppImageCreateUser extends AppState {}
class AppListImageAddPostHouses extends AppState {}
class AppListImageLoadingPostHouses extends AppState {}
class AppListImageAddPostCars extends AppState {}
class AppListImageLoadingPostCars extends AppState {}
class AppListImageAddPostLands extends AppState {}
class AppListImageLoadingPostLands extends AppState {}
class AppGetDataBase extends AppState {}
class AppCreateDataBase extends AppState {}
class AppLoadingGetDataBase extends AppState {}
class AppInsertDataBase extends AppState {}
class AppUpdateDataBase extends AppState {}
class AppDeleteDataBase extends AppState {}
class AppSearch extends AppState {}
class AppChangSelectRadioButtonHouses extends AppState {}
class AppChangSelectFilterHousesdirection extends AppState {}
class AppChangSelectRadioButtonCars extends AppState {}
class AppChangSelectRadioButtonLands extends AppState {}
class AppErrorPostFilterHouses extends AppState {}
class AppSuccessfulFilterHouses  extends AppState {}
class AppLoadingFilterHouses  extends AppState {}
class AppChangSelectFilterHousesFloor extends AppState{}
class AppChangSelectFilterHousesMinRoom extends AppState{}
class AppChangSelectFilterHousesMaxRoom extends AppState{}
class LoginLoadingState extends AppState{}
class AppChangIconVisib2 extends AppState{}