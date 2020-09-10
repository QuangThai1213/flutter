import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(3, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(4, 3),
];

List<Widget> _tiles = const <Widget>[
  const _GridLayoutTile(Colors.green, Icons.widgets, "News", [
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/grookey-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/scorbunny-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/sobble-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/detective-pikachu-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/galar-scenery-th.png',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/dynamax-battle-th.png'
  ]),
  const _GridLayoutTile(Colors.lightBlue, Icons.wifi, "Main", [
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/grookey-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/scorbunny-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/sobble-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/detective-pikachu-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/galar-scenery-th.png',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/dynamax-battle-th.png'
  ]),
  const _GridLayoutTile(Colors.amber, Icons.panorama_wide_angle, "Main", [
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/grookey-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/scorbunny-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/sobble-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/detective-pikachu-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/galar-scenery-th.png',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/dynamax-battle-th.png'
  ]),
  const _GridLayoutTile(Colors.brown, Icons.map, "Main", [
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/grookey-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/scorbunny-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/sobble-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/detective-pikachu-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/galar-scenery-th.png',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/dynamax-battle-th.png'
  ]),
  const _GridLayoutTile(Colors.deepOrange, Icons.send, "Main", [
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/grookey-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/scorbunny-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/sobble-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/detective-pikachu-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/galar-scenery-th.png',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/dynamax-battle-th.png'
  ]),
  const _GridLayoutTile(Colors.indigo, Icons.airline_seat_flat, "Main", [
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/grookey-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/scorbunny-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/sobble-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/pokemon/detective-pikachu-th.jpg',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/galar-scenery-th.png',
    'https://assets.pokemon.com//assets/cms2/img/misc/virtual-backgrounds/sword-shield/dynamax-battle-th.png'
  ]),
];

class GridLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _GridLayoutTile extends StatelessWidget {
  const _GridLayoutTile(
      this.backgroundColor, this.iconData, this.title, this.imgList);

  final Color backgroundColor;
  final IconData iconData;
  final String title;
  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final int min = 1;
    final int max = 5;
    var rn = new Random();
    return new Card(
      // color: backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              initialPage: rn.nextInt(2),
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: min + rn.nextInt(max - min)),
              autoPlayAnimationDuration: Duration(milliseconds: 500),
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                        width: width,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: SpinKitPouringHourglass(color: Colors.blue),
                          );
                        },
                      )),
                    ))
                .toList(),
          ),
          new InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/news');
            },
            child: new Center(
              child: new Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconData,
                        color: Colors.deepPurpleAccent,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: <Color>[
                                  Colors.red,
                                  Colors.white,
                                  Colors.black
                                ],
                              ).createShader(
                                  Rect.fromLTWH(60.0, 60.0, 80.0, 70.0))),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
