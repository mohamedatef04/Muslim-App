part of 'surahdetails_cubit.dart';

@immutable
abstract class SurahdetailsState {}

class SurahdetailsInitial extends SurahdetailsState {}

class SurahdetailsLoadingState extends SurahdetailsState {}

class SurahdetailsLoadedState extends SurahdetailsState {}

class SurahdetailsFailureState extends SurahdetailsState {}
