import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: WidgetWithNoAppBar(),
      routes: <String, WidgetBuilder>{
        '/with_app_bar': (_) => WidgetWithAppBar(),
        '/without_app_bar': (_) => WidgetWithNoAppBar(),
      },
    );
  }
}

class WidgetWithNoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                'The icons in the status bar (wifi, coverage, etc...) should be black the first time you run this app.'),
            Text(
                'This happens because we have set UIStatusBarStyle to UIStatusBarStyleDarkContent in Info.plist'),
            Text(
                'When you click on the button, you will see a widget with an app bar.'),
            Text(
                'You will also see that the icon colors in the status bar are changed (once you go to the next page).'),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text('With app bar!'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/with_app_bar');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetWithAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the app bar, recompile and the bug is gone. WTF?
      appBar: AppBar(
        // You can try changing the brightness, themes, nothing helps.
        title: Text('Sneaky app bar!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Oh snap, it changed the icons.'),
            Text(
                'Tap on this button to get to the scaffold without the app bar.'),
            Text('As you go back, notice that the icons stay white.'),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text('Without bar!'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/without_app_bar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
