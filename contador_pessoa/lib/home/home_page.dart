import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pessoas = 1;

  increment() {
    setState(() {
      pessoas++;
    });
  }

  decrement() {
    setState(() {
      pessoas--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador Pessoas'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Text(
              'Pessoas: $pessoas',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.remove), onPressed: decrement),
                IconButton(icon: Icon(Icons.add), onPressed: increment),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
