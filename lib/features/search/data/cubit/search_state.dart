part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccessState extends SearchState {}

class SearchFailureState extends SearchState {}

class SearchLoadingState extends SearchState {}
