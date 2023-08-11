// ignore_for_file: prefer_const_constructors, prefer_single_quotes
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Temp extends ConsumerStatefulWidget {
  const Temp({super.key});

  @override
  ConsumerState<Temp> createState() => _TempState();
}

class _TempState extends ConsumerState<Temp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
    );
  }
}
