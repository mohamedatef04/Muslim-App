part of 'surahinformation_cubit.dart';

@immutable
abstract class SurahInformationState {}

class SurahInformationInitial extends SurahInformationState {}

class SurahInformationLoadingState extends SurahInformationState {}

class SurahInformationLoadedState extends SurahInformationState {}

class SurahInformationFailureState extends SurahInformationState {}

