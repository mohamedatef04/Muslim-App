part of 'praytimes_cubit.dart';

abstract class PraytimesState {}

class PraytimesInitial extends PraytimesState {}

class PraytimesLoadedState extends PraytimesState {}

class PraytimesLoadingState extends PraytimesState {}

class PraytimesFailureState extends PraytimesState {}
