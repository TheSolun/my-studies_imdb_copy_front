import 'package:imdbdata/src/model/title_basics.dart';

class TitleBasicsMapper {
  static TitleBasics jsonToModel(Map<String, dynamic> json) {
    return TitleBasics(
      tconst: json['tconst'],
      titleType: json['titleType'],
      primaryTitle: json['primaryTitle'],
      originalTitle: json['originalTitle'],
      isAdult: json['adult'],
      startYear: json['startYear'],
      endYear: json['endYear'],
      runtimeMinutes: json['runtimeMinutes'],
      genre1: json['genre1'],
      genre2: json['genre2'],
      genre3: json['genre3'],
    );
  }

  static List<TitleBasics> jsonToListModel(List<dynamic> json) {
    List<TitleBasics> titles = [];
    for (Map<String, dynamic> titleJson in json) {
      titles.add(jsonToModel(titleJson));
    }
    return titles;
  }
}
