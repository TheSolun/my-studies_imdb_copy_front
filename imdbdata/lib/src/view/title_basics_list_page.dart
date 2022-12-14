import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdbdata/src/controller/bloc/title_basics_data_bloc/title_basics_data_bloc.dart';
import 'package:imdbdata/src/controller/bloc/title_basics_data_bloc/title_basics_data_bloc_event.dart';
import 'package:imdbdata/src/controller/bloc/title_basics_data_bloc/title_basics_data_bloc_state.dart';
import 'package:imdbdata/src/model/title_basics.dart';
import 'package:imdbdata/src/view/filter_title_basics_list_by_genre_form_page.dart';
import 'package:imdbdata/src/view/title_basics_page.dart';

class TitleBasicsListPage extends StatelessWidget {
  const TitleBasicsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TitleBasicsDataBloc(),
      child: const _Widget(),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TitleBasicsDataBloc, TitleBasicsDataBlocState>(
      listener: (context, state) {
        if (state is RequestFinishedWithNonSuccess) {
          String? message = state.message;
          if (message != null) {
            _showErrorSnackBar(context, message);
          }
        }
      },
      builder: (context, state) {
        if (state is NoRequestDone) {
          context.read<TitleBasicsDataBloc>().add(RequestAllTitleBasics());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('IMDB DATA'),
            actions: [
              TextButton(
                onPressed: () {
                  context
                      .read<TitleBasicsDataBloc>()
                      .add(RequestAllTitleBasics());
                },
                child: Text(
                  'Get all',
                  style: TextStyle(color: Colors.yellow[600]),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<TitleBasicsDataBloc>(context),
                        child: const FilterTitleBasicsListByGenreFormPage(),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Filter by genre',
                  style: TextStyle(color: Colors.yellow[600]),
                ),
              ),
            ],
          ),
          body: Container(
            color: Theme.of(context).backgroundColor,
            child: (state is RequestFinishedWithSuccess)
                ? _TitleBasicsList(state.titles)
                : (state is RequestFinishedWithNonSuccess)
                    ? null
                    : const _Loading(),
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/6/66/Loadingsome.gif',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }
}

class _TitleBasicsList extends StatelessWidget {
  final List<TitleBasics> _titles;

  const _TitleBasicsList(this._titles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Theme.of(context).colorScheme.outline,
        height: 0.5,
        thickness: 0.5,
      ),
      itemCount: _titles.length,
      itemBuilder: (BuildContext context, int index) {
        return _TitleBasicsListItem(_titles[index]);
      },
    );
  }
}

class _TitleBasicsListItem extends StatelessWidget {
  final TitleBasics _title;

  const _TitleBasicsListItem(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TitleBasicsPage(_title)),
        );
      },
      title: Text(
        _title.primaryTitle,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headline2?.fontSize,
        ),
      ),
      subtitle: Text(
        _title.startYear,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      dense: true,
    );
  }
}
