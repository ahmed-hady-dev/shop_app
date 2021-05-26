part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchInitial {}

class SearchSuccessState extends SearchInitial {}

class SearchErrorState extends SearchInitial {}
