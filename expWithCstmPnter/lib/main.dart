import 'package:expWithCstmPnter/testA.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cstm Pnter Stuff',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navigationIndex = 0;

  void _setNavigationIndex(int i) {
    setState(() {
      _navigationIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Painter Testing',
          style: TextStyle(
            color: Colors.pink[900],
          ),
        ),
        leading: Icon(Icons.border_style, color: Colors.pink[900],),
        backgroundColor: Colors.blueGrey[200],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey[500],
        child: _navigationIndex==0?TestA():Text('Test B'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.beach_access),
            title: Text('Test A'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Test B'),
          )
        ],
        selectedItemColor: Colors.pink[900],
        onTap: (i) {
          _setNavigationIndex(i);
        },
        currentIndex: _navigationIndex,
      ),
    );
  }
}
