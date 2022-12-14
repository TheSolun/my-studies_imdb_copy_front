import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:imdbdata/src/model/title_basics.dart';
import 'package:imdbdata/src/model/title_basics_mapper.dart';

import 'title_basics_data_bloc_event.dart';
import 'title_basics_data_bloc_state.dart';

class TitleBasicsDataBloc
    extends Bloc<TitleBasicsDataBlocEvent, TitleBasicsDataBlocState> {
  final String _host = 'http://10.0.2.2:8080/title-basics';

  TitleBasicsDataBloc() : super(NoRequestDone()) {
    on<RequestAllTitleBasics>(_onRequestAllTitleBasics);
    on<RequestTitleBasicsFilteredByGenre>(_onRequestTitleBasicsFilteredByGenre);
  }

  Future<void> _onRequestTileBasics(
    Emitter<TitleBasicsDataBlocState> emit,
    String url,
  ) async {
    emit(Requesting());
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        emit(
          RequestFinishedWithSuccess(
            TitleBasicsMapper.jsonToListModel(jsonDecode(response.body)),
          ),
        );
      } else {
        log(
          'request finished with non success: code: ${response.statusCode}, message: ${jsonDecode(response.body)['Error']}',
        );
        emit(
          RequestFinishedWithNonSuccess(
            statusCode: response.statusCode,
            message: jsonDecode(response.body)['Error'],
          ),
        );
      }
    } catch (e) {
      if (e.toString() == 'Connection refused') {
        log(
          'request finished with non success: code: 502, message: ${e.toString()}',
        );
        emit(
          RequestFinishedWithNonSuccess(
            statusCode: 502,
            message: 'Error',
          ),
        );
      }
    }
  }

  Future<void> _onRequestAllTitleBasics(
    RequestAllTitleBasics event,
    Emitter<TitleBasicsDataBlocState> emit,
  ) async {
    await _onRequestTileBasics(emit, '$_host/all');
  }

  Future<void> _onRequestTitleBasicsFilteredByGenre(
    RequestTitleBasicsFilteredByGenre event,
    Emitter<TitleBasicsDataBlocState> emit,
  ) async {
    await _onRequestTileBasics(emit, '$_host/all/${event.genre}');
  }
}
