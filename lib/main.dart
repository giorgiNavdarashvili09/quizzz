import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final questions = ["რა მქვია?", "რამდენი წლის ვარ?"];

  final answersA = ["სანდრო", "23"];

  final answersB = ["ნინო", "28"];

  final answersC = ["გიორგი", "12"];

  final answersD = ["ნიკა", "1"];

  final correctAnswers = ["გიორგი", "28"];

  var index = 0;

  var buttonAColor = Colors.blue;
  var buttonBColor = Colors.blue;
  var buttonCColor = Colors.blue;
  var buttonDColor = Colors.blue;

  var nextQuestionVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzz'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[index]),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (correctAnswers[index] == answersA[index]) {
                      setState(() {
                        buttonAColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        buttonAColor = Colors.red;
                      });
                    }
                  },
                  child: Container(
                    color: buttonAColor,
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      answersA[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (correctAnswers[index] == answersB[index]) {
                      setState(() {
                        buttonBColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        buttonBColor = Colors.red;
                      });
                    }
                  },
                  child: Container(
                    color: buttonBColor,
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      answersB[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (correctAnswers[index] == answersC[index]) {
                      setState(() {
                        buttonCColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        buttonCColor = Colors.red;
                      });
                    }
                  },
                  child: Container(
                    color: buttonCColor,
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      answersC[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (correctAnswers[index] == answersD[index]) {
                      setState(() {
                        buttonDColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        buttonDColor = Colors.red;
                      });
                    }
                  },
                  child: Container(
                    color: buttonDColor,
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      answersD[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36,),
            Visibility(
              visible: nextQuestionVisible,
              child: ElevatedButton(onPressed: (){

                if(questions.length > index + 1) {
                  setState(() {
                    index++;
                    buttonAColor = Colors.blue;
                    buttonBColor = Colors.blue;
                    buttonCColor = Colors.blue;
                    buttonDColor = Colors.blue;
                  });
                } else {
                  setState(() {
                    nextQuestionVisible = false;
                  });
                }
              }, child: const Text('Next Question')),
            )
          ],
        ),
      ),
    );
  }
}
