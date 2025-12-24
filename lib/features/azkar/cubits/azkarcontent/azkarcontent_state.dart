part of 'azkarcontent_cubit.dart';

@immutable
abstract class AzkarcontentState {}

class AzkarcontentInitial extends AzkarcontentState {}

class AzkarContentSuccessState extends AzkarcontentState {}

class AzkarContentFailureState extends AzkarcontentState {}

class AzkarContentLoadingState extends AzkarcontentState {}

