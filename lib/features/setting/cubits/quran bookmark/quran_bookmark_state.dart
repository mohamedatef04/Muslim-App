part of 'quran_bookmark_cubit.dart';

@immutable
abstract class QuranBookmarkState {}

class QuranBookmarkInitialState extends QuranBookmarkState {}

class QuranBookmarkUpdatedState extends QuranBookmarkState {
  final List<SurahDetailsModel> details;

  QuranBookmarkUpdatedState(this.details);
}
