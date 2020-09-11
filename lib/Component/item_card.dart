import 'package:cowell/Container/detail_screen.dart';
import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int index;
  final String backgroundImage;
  final Operator operator;
  const ItemCard(
    this.index,
    this.backgroundImage,
    this.operator,
  );
  @override
  Widget build(BuildContext context) {
    getColors(rarity) {
      switch (rarity) {
        case 0:
          return Colors.white;
        case 1:
          return Colors.white;
        case 2:
          return Colors.white;
        case 3:
          return Color(0xFFA96CFF);
        case 4:
          return Colors.yellow;
        case 5:
          return Colors.red;
      }
    }

    List<Color> colors = [
      Color(0xFFFF0064),
      Color(0xFFFF7600),
      Color(0xFFFFD500),
      Color(0xFF8CFE00),
      Color(0xFF00E86C),
      Color(0xFF00F4F2),
      Color(0xFF00CCFF),
      Color(0xFF70A2FF),
      Color(0xFFA96CFF)
    ];
    List<double> stops = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
    return Container(
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detail',
              arguments: DetailPageArgument(operator, index));
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            operator.name,
            style: TextStyle(
              color: getColors(operator.rarity),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.xor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(backgroundImage),
        ),
        gradient: LinearGradient(
          colors: colors,
          stops: stops,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: getColors(operator.rarity),
            blurRadius: 4.0,
            offset: const Offset(0.0, 7.0),
          ),
        ],
      ),
    );
  }
}
