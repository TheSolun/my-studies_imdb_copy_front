import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdbdata/src/controller/bloc/title_basics_data_bloc/title_basics_data_bloc.dart';
import 'package:imdbdata/src/controller/bloc/title_basics_data_bloc/title_basics_data_bloc_event.dart';
import 'package:imdbdata/src/controller/bloc/title_basics_data_bloc/title_basics_data_bloc_state.dart';

class FilterTitleBasicsListByGenreFormPage extends StatefulWidget {
  const FilterTitleBasicsListByGenreFormPage({Key? key}) : super(key: key);

  @override
  State<FilterTitleBasicsListByGenreFormPage> createState() =>
      _FilterTitleBasicsListByGenreFormPageState();
}

class _FilterTitleBasicsListByGenreFormPageState
    extends State<FilterTitleBasicsListByGenreFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          left: MediaQuery.of(context).size.width * 0.02,
        ),
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _textEditingController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Genre',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  BlocBuilder<TitleBasicsDataBloc, TitleBasicsDataBlocState>(
                    builder: (context, state) => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.secondary,
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<TitleBasicsDataBloc>().add(
                                RequestTitleBasicsFilteredByGenre(
                                  _textEditingController.value.text,
                                ),
                              );
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
