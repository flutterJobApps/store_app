import 'package:flutter/material.dart';
import 'package:store/layout/home/tabs/categories/category_item.dart';
import 'package:store/layout/home/tabs/categories/sidebar_item.dart';
import 'package:store/shared/styles/colors.dart';

class CategoriesTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.primaryColor,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: appColors.lightColor,
            fontSize: 18,
            fontFamily: 'roboto'
          ),
        )
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                color: appColors.lightColor,
                child: Column(
                  children: [
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'beauty & nurse'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'beauty & nurse & test'),
                    SidebarItem(name: 'beauty & nurse & test'),
                    SidebarItem(name: 'beauty & nurse & test'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'beauty & nurse'),
                    SidebarItem(name: 'fashion'),
                    SidebarItem(name: 'fashion'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: appColors.lightColor,
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
                            'ALL PRODUCTS',
                            style: TextStyle(
                              fontSize: 12.0
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
