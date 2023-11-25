import 'package:flutter/material.dart';

class TemperatureDropdown extends StatefulWidget {
  final String? selectedValue;
  final Function(String? newValue)? onChanged;

  const TemperatureDropdown({
    Key? key,
    required this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TemperatureDropdown> createState() => _TemperatureDropdownState();
}

class _TemperatureDropdownState extends State<TemperatureDropdown> {
  String selectedTemperature = '';

  @override
  void initState() {
    super.initState();
    selectedTemperature = widget.selectedValue!;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Temperature'),
      value: selectedTemperature.isEmpty ? null : selectedTemperature,
      onChanged: (String? newValue) {
        setState(() {
          selectedTemperature = newValue!;
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        });
      },
      items: List.generate(101, (index) => index - 50)
          .map<DropdownMenuItem<String>>((int value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text('$value °C'),
        );
      }).toList(),
    );
  }
}
