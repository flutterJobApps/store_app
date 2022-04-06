import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/product_model.dart';
import 'package:store/shared/cubit/app_cubit/cubit.dart';
import 'package:store/shared/styles/colors.dart';

import '../../shared/cubit/app_cubit/states.dart';

class CartItem extends StatelessWidget {
  ProductModel product;

  CartItem(this.product);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Row(
          children: [
            Container(
              color: appColors.lightColor,
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Image.network(
                product.imagePath,
                width: 150,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: appColors.lightColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(12.0),
                    topEnd: Radius.circular(12.0)
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name.toUpperCase()),
                        CircleAvatar(
                          backgroundColor: appColors.errorDarkColor,
                          radius: 14.0,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.remove
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          color: appColors.primaryColor,
                          fontSize: 16.00,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              '${product.description}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 14.0,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.add
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('23'),
                            ),
                            CircleAvatar(
                              radius: 14.0,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.remove
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.favorite_border)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
