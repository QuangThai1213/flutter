import 'package:flutter/material.dart';
import 'package:cowell/Model/pokemon.dart';
import 'package:cowell/Component/separator.dart';
import 'package:cowell/Component/detail_layout.dart';

class PokemonSummary extends StatelessWidget {
  final Pokemon pokemon;
  final bool horizontal;

  PokemonSummary(this.pokemon, {this.horizontal = true});

  PokemonSummary.vertical(this.pokemon) : horizontal = false;
  @override
  Widget build(BuildContext context) {
    String imageNumber = pokemon.id.toString().padLeft(3, "0");
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: "${pokemon.id}",
        child: Image(
          image: AssetImage("assets/images/$imageNumber.png"),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      if (value == null) {
        value = "0";
      }
      return Container(
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset(image, height: 12.0),
          Container(width: 8.0),
          Text(value, style: TextStyle(fontStyle: FontStyle.normal)),
        ]),
      );
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(pokemon.name.english, style: TextStyle(fontSize: 20)),
          Container(height: 10.0),
          Text(pokemon.type[1], style: TextStyle(fontStyle: FontStyle.normal)),
          Separator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: pokemon.base.attack.toString(),
                      image: 'assets/icon/atk.png')),
              Container(
                width: horizontal ? 8.0 : 10.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: pokemon.base.defense.toString(),
                      image: 'assets/icon/defense.png')),
              Container(
                width: horizontal ? 8.0 : 10.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: pokemon.base.hp.toString(),
                      image: 'assets/icon/hp.png')),
              Container(
                width: horizontal ? 8.0 : 10.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: pokemon.base.sp_attack.toString(),
                      image: 'assets/icon/atk.png')),
              Container(
                width: horizontal ? 8.0 : 10.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: pokemon.base.sp_defense.toString(),
                      image: 'assets/icon/resistance.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => DetailLayout(pokemon),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }
}
