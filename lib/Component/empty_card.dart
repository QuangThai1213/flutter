import 'package:cowell/Component/detail_item.dart';
import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  final double width;
  final double height;
  final int index;
  const EmptyCard(
    this.index,
    this.width,
    this.height,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          print(index);
          Navigator.pushNamed(context, '/detail',
              arguments: DetailPageArgument(index));
        },
        child: Text(
          index.toString(),
        ),
      ),
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
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
