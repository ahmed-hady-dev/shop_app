import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
        child: Text(
          'Categories',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
