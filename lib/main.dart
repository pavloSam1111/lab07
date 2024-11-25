import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Налаштування кутів контейнера'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: CornerRadiusConfigurator(),
      ),
    );
  }
}

class CornerRadiusConfigurator extends StatefulWidget {
  @override
  State<CornerRadiusConfigurator> createState() =>
      _CornerRadiusConfiguratorState();
}

class _CornerRadiusConfiguratorState extends State<CornerRadiusConfigurator> {
  double _topLeft = 0.0;
  double _topRight = 0.0;
  double _bottomLeft = 0.0;
  double _bottomRight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_topLeft),
                    topRight: Radius.circular(_topRight),
                    bottomLeft: Radius.circular(_bottomLeft),
                    bottomRight: Radius.circular(_bottomRight),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Налаштуйте кути контейнера',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3,
              children: [
                _buildSlider("Верхній лівий", _topLeft, (value) {
                  setState(() {
                    _topLeft = value;
                  });
                }),
                _buildSlider("Верхній правий", _topRight, (value) {
                  setState(() {
                    _topRight = value;
                  });
                }),
                _buildSlider("Нижній лівий", _bottomLeft, (value) {
                  setState(() {
                    _bottomLeft = value;
                  });
                }),
                _buildSlider("Нижній правий", _bottomRight, (value) {
                  setState(() {
                    _bottomRight = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ${value.toStringAsFixed(1)}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: Colors.blueAccent,
            inactiveTrackColor: Colors.blueGrey.shade200,
            thumbColor: Colors.blueAccent,
            overlayColor: Colors.blueAccent.withOpacity(0.2),
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 75,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

