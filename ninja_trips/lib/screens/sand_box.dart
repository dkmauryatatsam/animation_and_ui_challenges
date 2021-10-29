import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  SandBox({Key key}) : super(key: key);

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _margin = 20;

  double _opcity = 1;

  double _width = 200;

  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  _margin == 50 ? _margin = 20 : _margin = 50;
                });
              },
              child: Text('Animate Margin'),
              color: Colors.white,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _color == Colors.blue ? _color = Colors.purple : _color = Colors.blue;
                });
              },
              child: Text('Animate Color'),
              color: Colors.white,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _width == 200 ? _width = 400 : _width = 200;
                });
              },
              child: Text('Animate Width'),
              color: Colors.white,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _opcity == 1 ? _opcity = 0 : _opcity = 1;
                });
              },
              child: Text('Animate Opcity'),
              color: Colors.white,
            ),
            AnimatedOpacity(
              opacity: _opcity,
              duration: Duration(seconds: 1),
              child: Text(
                "Hide me",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
