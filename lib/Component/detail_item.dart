import 'package:flutter/material.dart';

class DetailPageArgument {
  const DetailPageArgument(this.index);
  final int index;
}

class DetailPage extends StatelessWidget {
  const DetailPage();

  @override
  Widget build(BuildContext context) {
    final DetailPageArgument args = ModalRoute.of(context).settings.arguments;
    print(args.index);
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Detail")),
        body: Text(args.index.toString()),
      ),
    );
  }
}
