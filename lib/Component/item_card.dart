import 'package:cowell/Component/detail_item.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final int index;
  final String backgroundImage;
  const ItemCard(
    this.index,
    this.backgroundImage,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detail',
              arguments: DetailPageArgument(index));
        },
        child: null,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(backgroundImage),
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
    );
  }
}
