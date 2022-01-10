// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'design.dart';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  late double n;
  late double m;
  late String res;
  String his = '';
  late String opera;
  String display = '';

  void click(String btn) {
    print(btn);
    if (btn == 'C') {
      try {
        res = res.substring(0, res.length - 1);
        print(res);
      } catch (e) {
        print(e);
      }
    } else if (btn == 'Ac') {
      n = 0;
      m = 0;
      display = '';
      res = '';
      his = '';
    } else if (btn == '%') {
      res = (n.toInt() / 100).toString();
    } else if (btn == '.') {
      if (!res.contains('.')) res += '.';
    } else if (btn == '+/-') {
      res.startsWith('-') ? res = res.substring(1) : res = '-' + res;
    } else if (btn == '+' || btn == '-' || btn == 'X' || btn == '/') {
      n = double.parse(display);
      res = '';
      opera = btn;
    } else if (btn == '=') {
      m = double.parse(display);
      if (opera == '+') {
        res = (n + m).toString();
        his = n.toString() + opera + m.toString();
      }
      if (opera == '-') {
        res = (n - m).toString();
        his = n.toString() + opera + m.toString();
      }
      if (opera == 'X') {
        res = (n * m).toString();
        his = n.toString() + opera + m.toString();
      }
      if (opera == '/') {
        res = (n / m).toString();
        his = n.toString() + opera + m.toString();
      }
    } else {
      res = display + btn;
    }

    setState(() {
      //  display = (res);
      display = res.split('.')[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*        backgroundColor: Color(0xFF28527a),
      backgroundColor: Color(0xFF8ac4d0), */
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        // ignore: prefer_const_constructors
        title: Text('الحـاســـبة',
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    alignment: const Alignment(1.0, 1.0),
                    child: Text(his,
                        style: const TextStyle(
                            fontSize: 30, color: Colors.black54)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 150,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    alignment: const Alignment(1.0, 1.0),
                    child: Text(display,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Design('+', click, Colors.pink),
                      Design('%', click, Colors.pink),
                      Design('C', click, Colors.pink),
                      Design('Ac', click, Colors.pink)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Design('-', click, Colors.pink),
                      Design('3', click, Colors.indigo),
                      Design('2', click, Colors.indigo),
                      Design('1', click, Colors.indigo)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Design('X', click, Colors.pink),
                      Design('6', click, Colors.indigo),
                      Design('5', click, Colors.indigo),
                      Design('4', click, Colors.indigo)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Design('/', click, Colors.pink),
                      Design('9', click, Colors.indigo),
                      Design('8', click, Colors.indigo),
                      Design('7', click, Colors.indigo)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Design('=', click, Colors.pink),
                      Design('+/-', click, Colors.indigo),
                      Design('.', click, Colors.indigo),
                      Design('0', click, Colors.indigo)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
