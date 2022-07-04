import 'package:films/widgets/film_item.dart';
import 'package:films/provider/films.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FilmGrid extends StatelessWidget {
  const FilmGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filmsData = Provider.of<Films>(context);
    final films = filmsData.films;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: films.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return ChangeNotifierProvider.value(
                  value: films[index], child: const FilmItem());
            }),
      ),
    );
  }
}
