import 'package:flutter/material.dart';

class InformacaoPage extends StatefulWidget {
  const InformacaoPage({Key? key}) : super(key: key);

  @override
  State<InformacaoPage> createState() => _InformacaoPageState();
}

class _InformacaoPageState extends State<InformacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildText(),
        ],
      ),
    );
  }

  buildText() {
    return Container(
      child: Row(
        children: [
          Text(
            'Layssa',
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          Text(
            'Dandara',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}