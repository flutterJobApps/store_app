import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/home_data_model.dart';
import 'package:store/shared/constants.dart';
import 'package:store/shared/styles/colors.dart';

class LatestProductItem extends StatelessWidget {

  var product;

  LatestProductItem(
  {
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    print(product.name);
    return Stack(
      children: [
        Image.network(
          '$baseUrl/products/${product.image}',
          height: 180,
          width: 260,
          fit: BoxFit.cover,
        ),
        Container(
          height: 180,
          width: 260,
          color: const Color.fromRGBO(0, 0, 0, .4),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? "no name",
                style: const TextStyle(
                  color: appColors.lightColor,
                  fontSize: 22.0
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: appColors.errorDarkColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  onPressed: () => null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'SEE MORE',
                        style: TextStyle(
                          color: appColors.lightColor,
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      CircleAvatar(
                        backgroundColor: appColors.lightColor,
                        radius: 15,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16.0,
                          color: appColors.errorDarkColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
