import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/home_data_model.dart';
import 'package:store/models/product_model.dart';
import 'package:store/shared/constants.dart';
import 'package:store/shared/cubit/app_cubit/cubit.dart';
import 'package:store/shared/cubit/app_cubit/states.dart';
import 'package:store/shared/styles/colors.dart';

class ProductItem extends StatelessWidget {

  var product;

  ProductItem({ required this.product });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 170.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: appColors.lightColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Image.network(
                '$baseUrl/products/${product.image}',
                height: 170.0,
                width: 130.0,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: appColors.thirdColor,
                radius: 15,
                child: IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.favorite_outline,
                    size: 15.0,
                    color: appColors.lightColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Container(
            width: 130.0,
            child: Text(
              product.name ?? "no name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: appColors.darkColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 130.0,
            child: Text(
              product.description ?? "no desc",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: appColors.darkColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 130.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${product.price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: appColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text('${product.rate}'),
                    const Icon(Icons.star, color: appColors.secondColor,),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

