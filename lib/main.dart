import 'package:flutter/material.dart';
import 'package:quizzz/other_page.dart';

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
  var score = 0;

  final questions = ["რა მქვია?", "რამდენი წლის ვარ?", "საიდან ვარ?"];

  final answersA = ["სანდრო", "23", "საქართველო"];

  final answersB = ["ნინო", "28", "საფრანგეთი"];

  final answersC = ["გიორგი", "12", "ამერიკა"];

  final answersD = ["ნიკა", "1", "იტალია"];

  final correctAnswers = ["გიორგი", "28", "საქართველო"];

  var index = 0;

  var buttonAColor = Colors.blue;
  var buttonBColor = Colors.blue;
  var buttonCColor = Colors.blue;
  var buttonDColor = Colors.blue;

  var nextQuestionVisible = true;

  var alreadyAnswered = false;

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
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                    buttonAColor = Colors.blue;
                    buttonBColor = Colors.blue;
                    buttonCColor = Colors.blue;
                    buttonDColor = Colors.blue;
                    score = 0;
                    alreadyAnswered = false;
                    nextQuestionVisible = true;
                  });
                },
                child: const Text("reset")),
            Text("Score: $score", style: TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),),
            Text(questions[index]),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {

                    if (!alreadyAnswered) {
                      if (correctAnswers[index] == answersA[index]) {
                        setState(() {
                          score++;
                          buttonAColor = Colors.green;
                        });
                      } else {
                        setState(() {
                          buttonAColor = Colors.red;
                        });
                      }
                    }
                    setState(() {
                      alreadyAnswered = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: buttonAColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
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
                    if(!alreadyAnswered) {
                      if (correctAnswers[index] == answersB[index]) {
                        setState(() {
                          score++;
                          buttonBColor = Colors.green;
                        });
                      } else {
                        setState(() {
                          buttonBColor = Colors.red;
                        });
                      }
                    }
                    setState(() {
                      alreadyAnswered = true;
                    });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonBColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))

                    ),
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
                    if(!alreadyAnswered) {
                      if (correctAnswers[index] == answersC[index]) {
                        setState(() {
                          score++;
                          buttonCColor = Colors.green;
                        });
                      } else {
                        setState(() {
                          buttonCColor = Colors.red;
                        });
                      }
                    }
                    setState(() {
                      alreadyAnswered = true;
                    });
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
                    if(!alreadyAnswered) {
                      if (correctAnswers[index] == answersD[index]) {
                        setState(() {
                          score++;
                          buttonDColor = Colors.green;
                        });
                      } else {
                        setState(() {
                          buttonDColor = Colors.red;
                        });
                      }
                    }
                    setState(() {
                      alreadyAnswered = true;
                    });
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
            const SizedBox(
              height: 36,
            ),
            Visibility(
              visible: nextQuestionVisible,
              child: ElevatedButton(
                  onPressed: () {
                    if (questions.length > index + 1) {
                      setState(() {
                        index++; // 0 -> 1
                      });
                    }

                    if (index == questions.length - 1) {
                      {
                        setState(() {
                          nextQuestionVisible = false;
                        });
                      }
                    }
                    buttonAColor = Colors.blue;
                    buttonBColor = Colors.blue;
                    buttonCColor = Colors.blue;
                    buttonDColor = Colors.blue;
                    alreadyAnswered = false;
                  },
                  child: const Text('Next Question')),
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtherPage(score: score)));
            }, child: Text("Go To Score Screen"))
          ],
          
        ),
      ),
    );
  }
}
