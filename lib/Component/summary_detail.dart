import 'package:flutter/material.dart';

class SummaryDetail extends StatefulWidget {
  @override
  _SummaryDetailState createState() => _SummaryDetailState();
}

class _SummaryDetailState extends State<SummaryDetail> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(_value.toInt().toString()),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 4.0,
              thumbColor: Colors.redAccent,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
              min: 0.0,
              max: 100.0,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value.roundToDouble();
                });
              },
            ),
          ),
          Center(
            child: Text("data"),
          ),
        ],
      ),
    );
  }
}
