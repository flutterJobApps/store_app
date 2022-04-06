import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/modules/cart/cart_item.dart';
import 'package:store/shared/cubit/app_cubit/cubit.dart';
import 'package:store/shared/cubit/app_cubit/states.dart';
import 'package:store/shared/styles/colors.dart';

class CartScreen extends StatelessWidget {

  static const String routeName = 'cartRoute';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.00,
            backgroundColor: appColors.primaryBgColor,
            title: const Text(
              'Cart',
              style: TextStyle(
                fontSize: 18.0,
                color: appColors.lightColor
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart Items',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 20.0,),
                Expanded(
                  child: Text('test'),
                  // child: cubit.cart.isNotEmpty ? SingleChildScrollView(
                  //   child: Column(
                  //     children: cubit.cart.map((el) => CartItem(el)).toList()
                  //   ),
                  // ):
                  // Center(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset('assets/images/onboarding_3.png', width: 120,),
                  //       SizedBox(height: 20.0),
                  //       Text('Cart Is Empty'),
                  //       SizedBox(height: 20.0),
                  //       Text('go home to browse products'),
                  //     ],
                  //   ),
                  // ),
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  width: double.infinity,
                  color: appColors.lightColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub Total'),
                          Text('\$ 250'),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appColors.primaryBgColor,
                        ),
                        child: MaterialButton(
                          onPressed: null,
                          child: Text(
                            'Check Proccess',
                            style: TextStyle(
                              color: appColors.lightColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
