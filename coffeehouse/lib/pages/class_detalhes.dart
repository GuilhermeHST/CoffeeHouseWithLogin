import 'package:flutter/material.dart';

class ClassDetalhes extends StatefulWidget {
  const ClassDetalhes({
    Key? key,
  }) : super(key: key);

  @override
  _ClassDetalhesState createState() => _ClassDetalhesState();
}

class _ClassDetalhesState extends State<ClassDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  buildBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DETALHES',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}