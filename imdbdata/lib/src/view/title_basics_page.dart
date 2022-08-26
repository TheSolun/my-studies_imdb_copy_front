import 'package:flutter/material.dart';
import 'package:imdbdata/src/model/title_basics.dart';

class TitleBasicsPage extends StatelessWidget {
  final TitleBasics _title;

  const TitleBasicsPage(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title.primaryTitle)),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          left: MediaQuery.of(context).size.width * 0.02,
        ),
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(
                _title.primaryTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Row(
              children: (_title.runtimeMinutes != null)
                  ? [
                      _getTextWithHeadline4TextStyle(
                        context,
                        _title.startYear,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: _getTextWithHeadline4TextStyle(
                          context,
                          (_title.isAdult) ? 'R' : 'G',
                        ),
                      ),
                      _getTextWithHeadline4TextStyle(
                        context,
                        '${_title.runtimeMinutes}m',
                      ),
                    ]
                  : [
                      Container(
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: _getTextWithHeadline4TextStyle(
                          context,
                          _title.startYear,
                        ),
                      ),
                      _getTextWithHeadline4TextStyle(
                        context,
                        (_title.isAdult) ? 'R' : 'G',
                      ),
                    ],
            ),
            Divider(color: _getHeadline4TextStyleColor(context)),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: _getTextWithHeadline3TextStyle(
                context,
                'Original title: ${_title.originalTitle}',
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: _getTextWithHeadline3TextStyle(
                context,
                'Title type: ${_title.titleType}',
              ),
            ),
            Divider(color: _getHeadline4TextStyleColor(context)),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: _getTextWithHeadline3TextStyle(context, 'Genres'),
            ),
            _getGenresComponent(context, _titleGenres),
          ],
        ),
      ),
    );
  }

  List<String> get _titleGenres {
    List<String> genresList = [];
    if (_title.genre1 != null) {
      genresList.add(_title.genre1!);
    }
    if (_title.genre2 != null) {
      genresList.add(_title.genre2!);
    }
    if (_title.genre3 != null) {
      genresList.add(_title.genre3!);
    }
    return genresList;
  }

  Widget _getGenresComponent(BuildContext context, List<String> genres) {
    List<Widget> children = [];
    for (int i = 0; i < genres.length; i++) {
      if (i < (genres.length - 1)) {
        children.add(
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: _getOneGenreWidget(context, genres[i]),
          ),
        );
      } else {
        children.add(_getOneGenreWidget(context, genres[i]));
      }
    }
    return Row(children: children);
  }

  Widget _getOneGenreWidget(BuildContext context, String genre) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.025,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: _getHeadline4TextStyleColor(context) ?? Colors.black,
          style: BorderStyle.solid,
        ),
      ),
      child: _getTextWithHeadline3TextStyle(context, genre),
    );
  }

  Text _getTextWithHeadline3TextStyle(BuildContext context, String str) {
    return Text(str, style: Theme.of(context).textTheme.headline3);
  }

  Text _getTextWithHeadline4TextStyle(BuildContext context, String str) {
    return Text(str, style: _getHeadline4TextStyle(context));
  }

  Color? _getHeadline4TextStyleColor(BuildContext context) {
    return _getHeadline4TextStyle(context)!.color;
  }

  TextStyle? _getHeadline4TextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline4;
  }
}
