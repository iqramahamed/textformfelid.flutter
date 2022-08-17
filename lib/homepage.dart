import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  HomePage(this.email, this.password);

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(children: [Text("${email}"), Text("${password}")]),
      ),
    );
  }
}
