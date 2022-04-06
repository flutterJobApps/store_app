import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/home_data_model.dart';
import 'package:store/modules/cart/cart_screen.dart';
import 'package:store/shared/components/category/category_item.dart';
import 'package:store/shared/components/product/lastest_product_item.dart';
import 'package:store/shared/components/product/product_item.dart';
import 'package:store/shared/constants.dart';
import 'package:store/shared/cubit/app_cubit/cubit.dart';
import 'package:store/shared/cubit/app_cubit/states.dart';
import 'package:store/shared/styles/colors.dart';

class HomeTab extends StatelessWidget {

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
            backgroundColor: appColors.primaryColor,
            titleSpacing: 12.00,
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsetsDirectional.only(start: 16.0),
                    decoration: BoxDecoration(
                      color: appColors.lightColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Product ...',
                        border: InputBorder.none,
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Icon(Icons.search, color: appColors.primaryColor,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                iconSize: 25.0,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CartScreen.routeName,
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: appColors.lightColor,
                )
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: FutureBuilder(
              future: cubit.getHomeData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: appColors.primaryColor,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'something went wrong',
                    ),
                  );
                }
                if (snapshot.hasData) {
                  var homeData = snapshot.data.data;
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryItem(
                              imagePath: '$baseUrl/categories/${homeData.categories[index].image}',
                              category: homeData.categories[index]?.name ?? "no category",
                            ),
                            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
                            itemCount: homeData.categories!.length ?? 0,
                          ),
                        ),
                        const SizedBox(height: 24.0,),

                        Text(
                          'Latest',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          height: 180,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => LatestProductItem(
                              product: homeData.latestProducts![index],
                            ),
                            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
                            itemCount: homeData.latestProducts!.length,
                          ),
                        ),
                        const SizedBox(height: 24.0,),
                        Column(
                          children: handleCategories(homeData.categories, context),
                        ),
                      ],
                    ),
                  );
                }
                return Text('something else');
              },
            ),
          ),
        );
      },
    );
  }

  List<Widget> handleCategories(var categories, context) {
    List<Widget> widgets = [];
    for (int i = 0; i < categories.length; i++) {
      widgets.add(
        Column(
          children: [
            Text(
              categories[i].name,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductItem(
                  product: categories[i].products[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 16.0),
                itemCount: categories[i].products.length,
              ),
            )
          ],
        )
      );
    }
    return widgets;
  }

}
