import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.chosenAnswers,required this.onRestart});
  final List<String> chosenAnswers ;
  final void Function() onRestart;

  List<Map<String,Object>> summaryData(){
    final List<Map<String,Object>> summary = [];
    for(int i = 0; i < chosenAnswers.length ; i++){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'selected_answer' : chosenAnswers[i],
      });
    }
    return summary;

  }
  @override
  Widget build(context) {
    final summaryDataList = summaryData();
    final numberOfQuestion = questions.length;
    final numberOfCorrect = summaryDataList.where((data){
      return data['correct_answer'] == data['selected_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered $numberOfCorrect out of $numberOfQuestion questions correctly!',
               style: GoogleFonts.lato(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: const Color.fromARGB(255, 201, 153, 251),
               ),
               textAlign: TextAlign.center,
             ),
            const SizedBox(
              height: 35,
            ),
            QuestionsSummary(summaryDataList,),
            const SizedBox(
              height: 35,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.refresh,
              ),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
