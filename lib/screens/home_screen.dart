import 'package:flutter/material.dart';

import '../data/vegetable_data.dart';
import '../widgets/drop_down_menu_humidity.dart';
import '../widgets/drop_down_menu_temperature.dart';
import '../widgets/drop_down_menu_vegetables.dart';
import '../widgets/start_button.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedVegetable = '';
  String selectedTemperature = '';
  String selectedHumidity = '';

  void updateTemperatureAndHumidity() {
    if (selectedVegetable == '') {
      selectedTemperature = '';
      selectedHumidity = '';
    } else {
      final vegetableInfo = vegetableData[selectedVegetable];
      selectedTemperature =
          '${vegetableInfo!['temperatureRange']![0]} - ${vegetableInfo['temperatureRange']![1]} °C';
      selectedHumidity =
          '${vegetableInfo['humidityRange']?[0]} - ${vegetableInfo['humidityRange']?[1]} %';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCFF299),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'E-Issiqxona',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreenhouseDropdown(
                greenhouseOptions: vegetableData.keys.toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedVegetable = newValue!;
                    updateTemperatureAndHumidity();
                  });
                },
              ),
              TemperatureDropdown(
                selectedValue: selectedTemperature,
              ),
              HumidityDropdown(
                selectedValue: selectedHumidity,
              ),
            ],
          ),
          const CircularStartButton(),
        ],
      ),
    );
  }
}
