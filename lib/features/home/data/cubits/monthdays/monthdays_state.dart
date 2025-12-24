part of 'monthdays_cubit.dart';

@immutable
abstract class MonthdaysState {}

class MonthdaysInitial extends MonthdaysState {}

class MonthdaysLoadedState extends MonthdaysState {}

class MonthdaysLoadingState extends MonthdaysState {}

class MonthdaysFailureState extends MonthdaysState {}

