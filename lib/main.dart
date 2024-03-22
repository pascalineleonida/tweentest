import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation1;
  late Animation<Offset> _offsetAnimation2;
  late Animation<Offset> _offsetAnimation3;
  late Animation<Offset> _offsetAnimation4;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Durée totale de l'animation
    );

    _offsetAnimation1 = Tween<Offset>(
      begin: Offset(2.0,0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.2, curve: Curves.easeInOut), // Intervalle de temps pour le premier rectangle
      ),
    );

    _offsetAnimation2 = Tween<Offset>(
      begin: Offset(2.0,0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 0.4, curve: Curves.easeInOut), // Intervalle de temps pour le deuxième rectangle
      ),
    );

    _offsetAnimation3 = Tween<Offset>(
      begin: Offset(2.0,0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.6, curve: Curves.easeInOut), // Intervalle de temps pour le troisième rectangle
      ),
    );

    _offsetAnimation4 = Tween<Offset>(
      begin: Offset(2.0,0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 0.8, curve: Curves.easeInOut), // Intervalle de temps pour le troisième rectangle
      ),
    );

    _animationController.forward();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation1,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            SlideTransition(
              position: _offsetAnimation2,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            SlideTransition(
              position: _offsetAnimation3,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SlideTransition(
                position: _offsetAnimation4,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


