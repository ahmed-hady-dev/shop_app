import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text(
          'Favorites',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
