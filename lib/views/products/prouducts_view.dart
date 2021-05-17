import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Center(
        child: Text(
          'Products',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
