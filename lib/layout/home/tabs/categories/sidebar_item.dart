import 'package:flutter/material.dart';
import 'package:store/shared/styles/colors.dart';

class SidebarItem extends StatelessWidget {
  String name;

  SidebarItem({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 5.0
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appColors.borderColor,
          )
        )
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 12,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
