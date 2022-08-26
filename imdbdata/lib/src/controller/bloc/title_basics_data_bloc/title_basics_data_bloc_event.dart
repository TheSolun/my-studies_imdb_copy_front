abstract class TitleBasicsDataBlocEvent {}

class RequestAllTitleBasics extends TitleBasicsDataBlocEvent {}

class RequestTitleBasicsFilteredByGenre extends TitleBasicsDataBlocEvent {
  final String _genre;

  RequestTitleBasicsFilteredByGenre(this._genre);

  String get genre => _genre;
}
