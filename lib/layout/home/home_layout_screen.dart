import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/layout/home/tabs/categories/categories_tab.dart';
import 'package:store/layout/home/tabs/home/home_tab.dart';
import 'package:store/layout/home/tabs/profile/profile_tab.dart';
import 'package:store/layout/home/tabs/settings/settings_tab.dart';
import 'package:store/shared/cubit/app_cubit/cubit.dart';
import 'package:store/shared/cubit/app_cubit/states.dart';
import 'package:store/shared/styles/colors.dart';

class HomeLayoutScreen extends StatefulWidget {
  static const String routeName = 'homeLayoutRoute';

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  List<Widget> screens = [HomeTab(), CategoriesTab(), ProfileTab(), SettingsTab()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: appColors.primaryColor,
            ),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
              ),
              margin: const EdgeInsets.all(12.0),
              child: BottomNavigationBar(
                elevation: 0.00,
                showUnselectedLabels: false,
                currentIndex: currentIndex,
                selectedItemColor: appColors.thirdColor,
                unselectedItemColor: appColors.lightColor,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: 'categories',
                    icon: Icon(Icons.category_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(Icons.supervisor_account_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: 'Settings',
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
