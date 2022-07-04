import 'package:films/provider/film_model.dart';
import 'package:films/widgets/addfilmform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFilms extends StatelessWidget {
  const AddFilms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _name = TextEditingController();
    final _id = TextEditingController();
    final _desc = TextEditingController();
    final _imgurl = TextEditingController();
    final _director = TextEditingController();
    final _lauanguage = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Add Films"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Expanded(
          child: Column(
            children: [
              AddFilmField(
                text: "Movie id",
                controller: _id,
              ),
              AddFilmField(
                text: "Movie Name",
                controller: _name,
              ),
              AddFilmField(
                text: "Movie Lauanguage",
                controller: _lauanguage,
              ),
              AddFilmField(
                text: "Movie Description",
                controller: _desc,
              ),
              AddFilmField(
                text: "Movie director",
                controller: _director,
              ),
              Consumer<Film>(
                builder: (context, value, child) => ElevatedButton(
                    onPressed: () {
                      value.;
                    }, child: const Text("Upload Image")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
