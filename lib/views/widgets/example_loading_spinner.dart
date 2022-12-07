import 'package:flutter/material.dart';

class ExampleLoadingSpinner extends StatelessWidget {
  const ExampleLoadingSpinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 74,
            width: 74,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
