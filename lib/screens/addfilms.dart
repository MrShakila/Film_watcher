import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:films/provider/films.dart';
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
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
              const SizedBox(
                height: 10,
              ),
              Consumer<Films>(
                builder: (context, value, child) {
                  return GestureDetector(
                      onTap: () {
                        value.selectImage();
                      },
                      child: value.getImage.path == ""
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.amber),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Upload Image",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ))
                          : InkWell(
                              onTap: () {
                                value.selectImage();
                              },
                              child: SizedBox(
                                  width: 100,
                                  height: 200,
                                  child: Image.file(value.getImage))));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<Films>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      if (value.getImage.path == "") {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Error',
                          desc: 'Please picked the image',
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        if (_name.text.isNotEmpty &&
                            _desc.text.isNotEmpty &&
                            _director.text.isNotEmpty &&
                            _lauanguage.text.isNotEmpty) {
                          value.startSaveFilmInfo(
                              _name.text.trim(), context, _desc.text.trim());
                          _name.clear();
                          _lauanguage.clear();
                          _desc.clear();
                          _imgurl.clear();
                          _director.clear();
                          value.getImage.path == "";
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Error',
                            desc: 'Please fill all the fields',
                            btnOkOnPress: () {},
                          ).show();
                        }
                      }
                    }, //115@Naiwela
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Center(
                          child: Text(
                            "Save Film Info",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
