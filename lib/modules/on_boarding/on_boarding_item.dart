import 'package:flutter/material.dart';
import 'package:store/shared/styles/colors.dart';

class OnBoardingItem extends StatelessWidget {
  String imagePath;
  String title;
  String description;

  OnBoardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 250,
        ),
        const SizedBox(height: 20.00),
        Text(
          title,
          style: const TextStyle(
            color: appColors.primaryColor,
            fontSize: 26.00,
            fontFamily: 'Roboto'
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            wordSpacing: 2,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
