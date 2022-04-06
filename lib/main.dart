import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/layout/home/home_layout_screen.dart';
import 'package:store/modules/cart/cart_screen.dart';
import 'package:store/modules/on_boarding/on_boarding_screen.dart';
import 'package:store/shared/cubit/app_cubit/cubit.dart';
import 'package:store/shared/network/locale/shared_preferences_helper.dart';
import 'package:store/shared/network/remote/DioHelper.dart';
import 'package:store/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  
  bool isNotInOnBoarding = await SharedPreferencesHelper.getData('isNotInOnBoarding') ?? false;

  await DioHelper.init();

  runApp(MyApp(
    isNotInOnBoarding: isNotInOnBoarding,
  ));
}

class MyApp extends StatelessWidget {
  bool isNotInOnBoarding;

  MyApp({ required this.isNotInOnBoarding });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (conext) => AppCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'store',
        routes: {
          OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
          HomeLayoutScreen.routeName: (context) => HomeLayoutScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
        initialRoute: isNotInOnBoarding ? HomeLayoutScreen.routeName : OnBoardingScreen.routeName,
        theme: appTheme.defaulTheme,
      ),
    );
  }
}