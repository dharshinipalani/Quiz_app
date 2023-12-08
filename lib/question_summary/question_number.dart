import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber(
      {super.key, required this.questionIndex, required this.isCorrect});
  final int questionIndex;
  final bool isCorrect;
  @override
  Widget build(context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? const Color.fromARGB(255, 150, 198, 241) : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Text(
        (questionIndex + 1).toString(),
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
