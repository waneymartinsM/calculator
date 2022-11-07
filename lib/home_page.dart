import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var equation = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06121c),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      equation.toString(),
                      style: const TextStyle(
                        fontSize: 55,
                        color: Color(0xffaaaaaa),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      result.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Button(
                      title: 'AC',
                      onPress: () {
                        equation = '';
                        result = '';
                        setState(() {});
                      },
                      textColor: const Color(0xff73eee4),
                    ),
                    Button(
                      title: '+/-',
                      onPress: () {
                        equation += '-';
                        setState(() {});
                      },
                      textColor: const Color(0xffec98b2),
                    ),
                    Button(
                      title: '%',
                      onPress: () {
                        var count = equation
                            .replaceAll("=", "")
                            .replaceAll("", "")
                            .split("%");
                        if (count.length == 2) {
                          if (count[1].isNotEmpty) {
                            var result = (int.parse(count[0]) / 100) *
                                int.parse(count[1]);
                            setState(() {
                              equation = result.toString();
                            });
                          } else {
                            var result = int.parse(count[0]) / 100;
                            setState(() {
                              equation = result.toString();
                            });
                          }
                        } else if (count.length == 1 || count.length == 2) {
                          var s = int.parse(count[0]) / 100;
                          setState(() {
                            equation = s.toString();
                          });
                        }
                      },
                      textColor: const Color(0xffec98b2),
                    ),
                    Button(
                      title: '/',
                      onPress: () {
                        equation += '/';
                        setState(() {});
                      },
                      textColor: const Color(0xffec98b2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      title: '7',
                      onPress: () {
                        equation += '7';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '8',
                      onPress: () {
                        equation += '8';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '9',
                      onPress: () {
                        equation += '9';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: 'x',
                      onPress: () {
                        equation += 'x';
                        setState(() {});
                      },
                      textColor: const Color(0xffec98b2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      title: '4',
                      onPress: () {
                        equation += '4';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '5',
                      onPress: () {
                        equation += '5';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '6',
                      onPress: () {
                        equation += '6';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '-',
                      onPress: () {
                        equation += '-';
                        setState(() {});
                      },
                      textColor: const Color(0xffec98b2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      title: '1',
                      onPress: () {
                        equation += '1';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '2',
                      onPress: () {
                        equation += '2';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '3',
                      onPress: () {
                        equation += '3';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '+',
                      onPress: () {
                        equation += '+';
                        setState(() {});
                      },
                      textColor: const Color(0xffec98b2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      title: '0',
                      onPress: () {
                        equation += '0';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: '.',
                      onPress: () {
                        equation += '.';
                        setState(() {});
                      },
                      textColor: Colors.white,
                    ),
                    Button(
                      title: 'DEL',
                      onPress: () {
                        equation =
                            equation.substring(0, equation.length - 1);
                        setState(() {});
                      },
                      textColor: const Color(0xff73eee4),
                    ),
                    Button(
                      title: '=',
                      onPress: () {
                        buttonPressed();
                        setState(() {});
                      },
                      textColor: const Color(0xff73eee4),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void buttonPressed() {
    final eqtn = equation.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(eqtn);
    double eval = expression.evaluate(
      EvaluationType.REAL,
      ContextModel(),
    );
    result = eval.toString();
  }
}
