import 'dart:math';
import 'package:first_with_max/main.dart';
import 'package:flutter/material.dart';

class PSRGame extends State<MyApp> {
  var rand = Random();
  var choices = ['Rock', 'Paper', 'Scissors'];
  var rules = {'Rock': 'Scissors', 'Paper': 'Rock', 'Scissors': 'Paper'};
  String userChoice = '', compChoice = '?????', contidion = '';
  int userScore = 0, compScore = 0;
  void check() {
    compChoice = choices[rand.nextInt(choices.length)];

    if (rules[userChoice] == compChoice) {
      contidion = 'You Wins';
      userScore++;
    } else if (rules[compChoice] == userChoice) {
      contidion = 'You Lose';
      compScore++;
    } else {
      contidion = 'Draw';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rock Paper Scissors Game',
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'You: $userScore ',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Computer: $compScore',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(userChoice),
                    const Text(
                      'vs',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(compChoice),
                  ],
                ),
              ),
              Text(
                contidion,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      onPressed: () {
                        userChoice = 'Rock';
                        setState(check);
                      },
                      icon: Image.asset('assets/icons/rock.png'),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      onPressed: () {
                        userChoice = 'Scissors';
                        setState(check);
                      },
                      icon: Image.asset('assets/icons/scissors.png'),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      onPressed: () {
                        userChoice = 'Paper';
                        setState(check);
                      },
                      icon: Image.asset('assets/icons/paper.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
