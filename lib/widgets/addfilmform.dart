
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFilmField extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const AddFilmField({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: GoogleFonts.scada(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
