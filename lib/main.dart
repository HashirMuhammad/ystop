import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ystop_mystop/routes.dart';

void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yStop MyStop',
      debugShowCheckedModeBanner: false,
      // Update app theme data here
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes,
      initialRoute: '/login',
    );
  }
}
