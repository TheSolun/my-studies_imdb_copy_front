class TitleBasics {
  late final String _tconst;
  late final String _titleType;
  late final String _primaryTitle;
  late final String _originalTitle;
  late final bool _isAdult;
  late final String _startYear;
  late final String? _endYear;
  late final int? _runtimeMinutes;
  late final String? _genre1;
  late final String? _genre2;
  late final String? _genre3;

  TitleBasics({
    required String tconst,
    required String titleType,
    required String primaryTitle,
    required String originalTitle,
    required bool isAdult,
    required String startYear,
    String? endYear,
    int? runtimeMinutes,
    String? genre1,
    String? genre2,
    String? genre3,
  }) {
    _tconst = tconst;
    _titleType = titleType;
    _primaryTitle = primaryTitle;
    _originalTitle = originalTitle;
    _isAdult = isAdult;
    _startYear = startYear;
    _endYear = endYear;
    _runtimeMinutes = runtimeMinutes;
    _genre1 = genre1;
    _genre2 = genre2;
    _genre3 = genre3;
  }

  String get tconst => _tconst;
  String get titleType => _titleType;
  String get primaryTitle => _primaryTitle;
  String get originalTitle => _originalTitle;
  bool get isAdult => _isAdult;
  String get startYear => _startYear;
  String? get endYear => _endYear;
  int? get runtimeMinutes => _runtimeMinutes;
  String? get genre1 => _genre1;
  String? get genre2 => _genre2;
  String? get genre3 => _genre3;
}
