import 'package:films/provider/films.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/film_model.dart';

class FilmDetail extends StatelessWidget {
  const FilmDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String filmId = ModalRoute.of(context)!.settings.arguments as String;
    final film = Provider.of<Films>(context).findById(filmId);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            Consumer<Films>(
              builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      value.findById(filmId).toggleFavouriteStates();
                    },
                    icon: const Icon(Icons.favorite));
              },
            )
          ]),
    );
  }
}
