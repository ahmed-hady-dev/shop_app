import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/views/shop/cubit/shop_cubit.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        var shopCubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Products'),
          ),
          body: ConditionalBuilder(
            condition: shopCubit.homeModel != null &&
                shopCubit.categoriesModel != null,
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
            builder: (context) => buildProductBody(
                shopCubit.homeModel, shopCubit.categoriesModel),
          ),
        );
      },
    );
  }

  Widget buildProductBody(
      HomeModel homeModel, CategoriesModel categoriesModel) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homeModel.data.banners
                .map((e) => Image(
                      image: NetworkImage(e.image),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250,
              reverse: false,
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildCategoryItem(categoriesModel.data.data[index]),
                    separatorBuilder: (context, index) => SizedBox(width: 10.0),
                    itemCount: categoriesModel.data.data.length,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'New Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.58,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(homeModel.data.products.length,
                  (index) => buildGridProduct(homeModel.data.products[index])),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridProduct(ProductModel model) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model.image.toString(),
                  ),
                  height: 200.0,
                  width: double.infinity,
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(height: 1.3),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}   ',
                        style: TextStyle(fontSize: 12, color: Colors.indigo),
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.oldPrice.round()}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildCategoryItem(DataModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.image.toString()),
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: 100,
            child: Text(
              model.name.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
}
