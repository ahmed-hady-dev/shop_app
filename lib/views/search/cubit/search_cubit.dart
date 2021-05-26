import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/core/constants.dart';
import 'package:shop_app/core/dioHelper/dio_helper.dart';
import 'package:shop_app/models/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

//===============================================================
  SearchModel searchModel;

  void search({String text}) async {
    emit(SearchLoadingState());
    Response response =
        await DioHelper.postData(url: SEARCH, data: {'text': text});
    try {
      emit(SearchSuccessState());
      searchModel = SearchModel.fromJson(response.data);
    } catch (error) {
      emit(SearchErrorState());
    }
  }
}
