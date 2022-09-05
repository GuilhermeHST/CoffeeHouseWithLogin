import 'dart:ui';
import 'package:coffeehouse/domain/cafes.dart';
import 'package:coffeehouse/data/BD.dart';
import 'package:coffeehouse/pages/localizao.dart';
import 'package:coffeehouse/pages/class_detalhes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffeehouse/pages/cafe_do_mes.dart';
import 'package:coffeehouse/widget/card_cafe_recomendados.dart';

class DestaquesPage extends StatefulWidget {
  const DestaquesPage({Key? key}) : super(key: key);

  @override
  State<DestaquesPage> createState() => _DestaquesPageState();
}

class _DestaquesPageState extends State<DestaquesPage> {
  List<Cafes> listaCafes = BD.lista;
  List<Cafes> lstaCafeMes = BD.cafeDoMes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: FutureBuilder<List<Cafes>>(
        future: BD.getValues(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Cafes> lista = snapshot.data ?? [];

            return SingleChildScrollView(
              child: Wrap(
                children: [
                  buildContainerCafe(
                      'https://intokildare.ie/wp-content/uploads/2018/01/pablo-1.png'),
                  buildSizedBox(),
                  buildCofeeHouseHeader(),
                  buildSizedBox(),
                  buildHeadCars('Recomendados', '+'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CardCafeRecomendado(cafeRecomendado: listaCafes[0]),
                        CardCafeRecomendado(cafeRecomendado: listaCafes[1]),
                        CardCafeRecomendado(cafeRecomendado: listaCafes[2]),
                      ],
                    ),
                  ),
                  buildSizedBox(),
                  buildHeadCars('Café do Mês', '+'),
                  CafeDoMes(cafeDoMes: lstaCafeMes[0]),
                  buildSizedBox(),
                  buildHeadCars('Localização', '+'),
                  Localizacao(),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildContainerCafe(imagem) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagem),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      padding: EdgeInsets.all(100),
    );
  }

  buildCofeeHouseHeader() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'COFFEE HOUSE',
            style: TextStyle(
              color: const Color(0xFF3E2723),
              fontSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2, bottom: 4),
            height: 5,
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF3E2723),
            ),
          ),
          const Icon(
            Icons.coffee_maker,
            size: 50,
            color: const Color(0xFF3E2723),
          ),
        ],
      ),
    );
  }

  buildSizedBox() {
    return const SizedBox(height: 8);
  }

  buildHeadCars(texto, textoBotao) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  texto.toUpperCase(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color(0XFF573629),
                    //decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 120),
                InkWell(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ClassDetalhes();
                        }),
                      );
                    },
                    child: Text(
                      textoBotao,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}