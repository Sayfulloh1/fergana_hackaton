import 'package:flutter/material.dart';

class HumidityDropdown extends StatefulWidget {
  final String? selectedValue;
  final Function(String? newValue)? onChanged;

  const HumidityDropdown({
    Key? key,
    required this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<HumidityDropdown> createState() => _HumidityDropdownState();
}

class _HumidityDropdownState extends State<HumidityDropdown> {
  String selectedHumidity = '';

  @override
  void initState() {
    super.initState();
    selectedHumidity = widget.selectedValue!;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Humidity'),
      value: selectedHumidity.isEmpty ? null : selectedHumidity,
      onChanged: (String? newValue) {
        setState(() {
          selectedHumidity = newValue!;
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        });
      },
      items: List.generate(101, (index) => index)
          .map<DropdownMenuItem<String>>((int value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text('$value%'),
        );
      }).toList(),
    );
  }
}
