part of 'azkarcategory_cubit.dart';

@immutable
abstract class AzkarcategoryState {}

class AzkarcategoryInitial extends AzkarcategoryState {}

class AzkarcategorySuccessState extends AzkarcategoryState {}

class AzkarcategoryFailureState extends AzkarcategoryState {}

class AzkarcategoryLoadingState extends AzkarcategoryState {}

