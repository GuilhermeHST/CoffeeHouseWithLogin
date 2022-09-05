import 'package:coffeehouse/domain/cafes.dart';
import 'package:flutter/cupertino.dart';

class CafeDoMes extends Cafes {
  final String igrediente1;
  final String igrediente2;
  final String igrediente3;

  CafeDoMes(
      imagem,
      cafe,
      preco,
      this.igrediente1,
      this.igrediente2,
      this.igrediente3,
      ) : super(imagem: imagem, cafe: cafe, preco: preco);
}