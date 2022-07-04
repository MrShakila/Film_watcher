import 'package:films/screens/addfilms.dart';
import 'package:films/widgets/film_grid.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _search = TextEditingController();
    return Scaffold(
      drawer: const Drawer(
        child: Text("This is Drawer"),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        centerTitle: true,
        // title: Text("Lets Watch", style: GoogleFonts.magra()),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.barsStaggered),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const AddFilms();
                  },
                ));
              }),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.userLarge))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Hi, Shakila 👋",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Watch Your favorite Movie Here",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _search.clear();
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: "Search Your Movie"),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Lateset Movies",
            style: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const FilmGrid(),
      ]),
    );
  }
}
