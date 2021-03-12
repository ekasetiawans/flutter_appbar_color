import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final appBarKey = GlobalKey<_AppBarKuState>();
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    controller.removeListener(_onScroll);
    controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (controller.position.extentBefore > 100) {
      appBarKey.currentState?.setColor(Colors.blue);
    } else {
      appBarKey.currentState?.setColor(Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppBarKu(
              key: appBarKey,
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
                itemCount: 1000,
              ),
            )
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppBarKu extends StatefulWidget {
  AppBarKu({Key key}) : super(key: key);

  @override
  _AppBarKuState createState() => _AppBarKuState();
}

class _AppBarKuState extends State<AppBarKu> {
  Color _color = Colors.blue;

  void setColor(Color value) {
    setState(() {
      _color = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      child: SafeArea(
        child: Container(
          height: 56,
        ),
      ),
    );
  }
}
