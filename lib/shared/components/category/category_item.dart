import 'package:flutter/material.dart';
import 'package:store/shared/styles/colors.dart';

class CategoryItem extends StatelessWidget {

  String imagePath;
  String category;

  CategoryItem({
    required this.imagePath,
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: appColors.lightColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Image.network(
            imagePath,
            height: 90.0,
            width: 60.0,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Container(
            width: 60,
            child: Text(
              category,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
