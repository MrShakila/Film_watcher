import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:films/contoller/filmuploader.dart';
import 'package:films/provider/film_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:logger/logger.dart';

class Films with ChangeNotifier {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference filmsstorage = FirebaseFirestore.instance.collection('films');
  // ignore: prefer_final_fields
  List<Film> _films = [
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "001",
        imgUrl: "images/poster/medium-cover_6.jpg",
        laguange: "English"),
    Film(
        name: "The Avengers",
        director: "	Joss Whedon",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "002",
        imgUrl: "images/poster/medium-cover_5.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "003",
        imgUrl: "images/poster/medium-cover_4.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "004",
        imgUrl: "images/poster/medium-cover_3.jpg",
        laguange: "English"),
    Film(
        name: "The Avengers",
        director: "	Joss Whedon",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "005",
        imgUrl: "images/poster/medium-cover_2.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "006",
        imgUrl: "images/poster/medium-cover.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "001",
        imgUrl: "images/poster/medium-cover_6.jpg",
        laguange: "English"),
    Film(
        name: "The Avengers",
        director: "	Joss Whedon",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "002",
        imgUrl: "images/poster/medium-cover_5.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "003",
        imgUrl: "images/poster/medium-cover_4.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "004",
        imgUrl: "images/poster/medium-cover_3.jpg",
        laguange: "English"),
    Film(
        name: "The Avengers",
        director: "	Joss Whedon",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "005",
        imgUrl: "images/poster/medium-cover_2.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "006",
        imgUrl: "images/poster/medium-cover.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "001",
        imgUrl: "images/poster/medium-cover_6.jpg",
        laguange: "English"),
    Film(
        name: "The Avengers",
        director: "	Joss Whedon",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "002",
        imgUrl: "images/poster/medium-cover_5.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "003",
        imgUrl: "images/poster/medium-cover_4.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "004",
        imgUrl: "images/poster/medium-cover_3.jpg",
        laguange: "English"),
    Film(
        name: "The Avengers",
        director: "	Joss Whedon",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "005",
        imgUrl: "images/poster/medium-cover_2.jpg",
        laguange: "English"),
    Film(
        name: "Black Widow",
        director: "Cate Shortland",
        desc:
            '''In Marvel Studios' action-packed spy thriller "Black Widow," Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.''',
        dateTime: DateTime(2019, 09, 17),
        id: "006",
        imgUrl: "images/poster/medium-cover.jpg",
        laguange: "English")
  ];
// 1967@Rashmi
  List<Film> get films {
    return [..._films];
  }

  void addFilm(Film film) {
    _films.add(film);
    notifyListeners();
  }

  // Film findByname(String name) {
  //   return _films.firstWhere((film) => film.name == name);
  // }

  Film findById(String Id) {
    return _films.firstWhere((film) => film.id == Id);
  }

  final Filmcontoller _filmcontoller = Filmcontoller();
  final ImagePicker _picker = ImagePicker();
  File _image = File("");

  File get getImage => _image;

  Future<void> selectImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
      } else {
        Logger().e("No Image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setisLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> startSaveFilmInfo(
    String title,
    BuildContext context,
    String desc,
  ) async {
  try {
    setisLoading(true);
    await _filmcontoller.saveFilmInfo(title, desc,_image );
    setisLoading(false);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Sucess',
      desc: 'Book Info saved sucessfull',
      btnOkOnPress: () {},
    ).show();
    Logger().i("Book is Saved");
  } catch (e) { Logger().i("Book is Not Saved == $e");
  }  
   
  
  }
}
