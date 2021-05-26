import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/views/shop/cubit/shop_cubit.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildCatItem(context,
                ShopCubit.get(context).categoriesModel.data.data[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: ShopCubit.get(context).categoriesModel.data.data.length,
          );
        },
      ),
    );
  }

  Padding buildCatItem(BuildContext context, DataModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image.toString()),
            fit: BoxFit.cover,
            height: 80.0,
            width: 80.0,
          ),
          SizedBox(width: 20),
          Text(
            model.name.toString(),
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
