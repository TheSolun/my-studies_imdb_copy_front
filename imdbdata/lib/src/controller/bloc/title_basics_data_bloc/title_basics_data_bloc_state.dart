import 'package:imdbdata/src/model/title_basics.dart';

abstract class TitleBasicsDataBlocState {}

class NoRequestDone extends TitleBasicsDataBlocState {}

class Requesting extends TitleBasicsDataBlocState {}

class RequestFinished extends TitleBasicsDataBlocState {}

class RequestFinishedWithSuccess extends RequestFinished {
  final List<TitleBasics> _titles;

  RequestFinishedWithSuccess(this._titles);

  List<TitleBasics> get titles => _titles;
}

class RequestFinishedWithNonSuccess extends RequestFinished {
  late final int _statusCode;
  late final String? _message;

  RequestFinishedWithNonSuccess({required int statusCode, String? message}) {
    _statusCode = statusCode;
    _message = message;
  }

  int get statusCode => _statusCode;
  String? get message => _message;
}
