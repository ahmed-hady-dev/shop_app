import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/views/search/cubit/search_cubit.dart';
import 'package:shop_app/widgets/build_list_product.dart';
import 'package:shop_app/widgets/customTextFormField.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var searchCubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Search'),
            ),
            body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      customTextFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        label: 'Search',
                        prefix: Icons.search,
                        onSubmit: (String text) {
                          searchCubit.search(text: text);
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some Text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      if (state is SearchLoadingState)
                        LinearProgressIndicator(),
                      SizedBox(height: 8),
                      if (state is SearchSuccessState)
                        Expanded(
                            child: ListView.separated(
                          itemBuilder: (context, index) => buildListProduct(
                              searchCubit.searchModel.data.data[index], context,
                              isOldPrice: false),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: searchCubit.searchModel.data.data.length,
                        )),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
