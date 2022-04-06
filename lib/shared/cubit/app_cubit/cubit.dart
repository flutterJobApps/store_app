import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/home_data_model.dart';
import 'package:store/shared/cubit/app_cubit/states.dart';
import 'package:store/shared/network/remote/DioHelper.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit(): super(InitAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  Future<dynamic> getHomeData() async {
    try {
      var response = await DioHelper.getData(url: '/get_home_data');
      HomeDataModel homeDataModel = HomeDataModel.fromJson(response.data);

      return homeDataModel;
    }
    catch(e) {
      return e.toString();
    }
  }

}