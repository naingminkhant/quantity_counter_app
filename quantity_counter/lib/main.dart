import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuantityPart(),
    );
  }
}

// ignore: must_be_immutable
class QuantityPart extends StatelessWidget {
  TextEditingController _flat_quantity = TextEditingController();
  TextEditingController _circle_quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quantity Counter'),
        ),
        body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                flatStyle(),
                SizedBox(
                  height: 50,
                ),
                circleStyle()
              ],
            )));
  }

  Widget flatStyle() {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            decoration: InputDecoration(hintText: 'Input integer value'),
            showCursor: false,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: _flat_quantity,
          ),
        ),
        IconButton(
            color: Colors.blue,
            splashColor: Colors.grey,
            splashRadius: 20.1,
            iconSize: 26,
            onPressed: () {
              int _num = int.tryParse(_flat_quantity.text) ?? 0;
              _flat_quantity.text = (_num + 1).toString();
            },
            icon: Icon(Icons.add)),
        IconButton(
            color: Colors.red,
            splashColor: Colors.grey,
            splashRadius: 20.1,
            iconSize: 26,
            onPressed: () {
              int _num = int.tryParse(_flat_quantity.text) ?? 1;
              if (_num <= 0) {
                return;
              }
              _flat_quantity.text = (_num - 1).toString();
            },
            icon: Icon(Icons.remove))
      ],
    );
  }

  Widget circleStyle() {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            decoration: InputDecoration(hintText: 'Enter integer value'),
            controller: _circle_quantity,
          ),
        ),
        ElevatedButton(
            style:
                ButtonStyle(shape: MaterialStateProperty.all(CircleBorder())),
            onPressed: () {
              _circle_quantity.text =
                  calculator(_circle_quantity.text, '+').toString();
            },
            child: Icon(Icons.add)),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                backgroundColor: MaterialStateProperty.all(Colors.grey)),
            onPressed: () {
              _circle_quantity.text =
                  calculator(_circle_quantity.text, '-').toString();
            },
            child: Icon(Icons.remove))
      ],
    );
  }

  int calculator(String num, String symbol) {
    int _num = int.tryParse(num) ?? 0;
    int result = 1;
    switch (symbol) {
      case '-':
        result = _num - result;
        break;
      case '+':
        result += _num;
        break;
      default:
        result = 0;
    }
    return result >= 0 ? result : 0;
  }
}
