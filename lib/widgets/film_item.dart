import 'package:films/provider/films.dart';
import 'package:films/screens/fildetail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/film_model.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final film = Provider.of<Film>(context);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const FilmDetail();
              },
            ));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(10)),
            height: 250,
            child: Image.asset(film.imgUrl),
            width: 180,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              height: 40,
              width: 40,
              child: Center(
                child: Consumer<Films>(builder: (context, value, child) {
                  return IconButton(
                      onPressed: () {
                        film.toggleFavouriteStates();
                      },
                      icon: film.isFav
                          ? const FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.pink,
                            )
                          : const FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.black,
                            ));
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
