import 'package:flutter/cupertino.dart';

class Film extends ChangeNotifier {
  final String name;
  final String desc;
  final DateTime dateTime;
  final String imgUrl;
  final String id;
  final String laguange;
  final String director;
  bool isFav;

  Film(
      {required this.name,required this.imgUrl, 
      required this.director,
      this.isFav = false,
      required this.desc,
      required this.dateTime,
      required this.id,
      required this.laguange});

  void toggleFavouriteStates() {
    isFav = !isFav;
    notifyListeners();
  }
}
