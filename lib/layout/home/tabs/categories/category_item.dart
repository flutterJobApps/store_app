import 'package:flutter/material.dart';
import 'package:store/shared/styles/colors.dart';

class CategoryItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
      decoration: BoxDecoration(
        color: appColors.lightColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appColors.borderColor,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'TELEVESION & VIDEOS',
                    style: TextStyle(
                      fontSize: 12.0
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'SEE ALL',
                  style: TextStyle(
                    color: appColors.secondColor,
                    fontSize: 12.0
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1/1.2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: appColors.lightColor,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/onboarding_3.png',
                    ),
                    Expanded(
                      child: Text(
                        'cv and monther and',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
