import 'package:fergana_hackaton/data/vegetable_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class GreenhouseDropdown extends StatefulWidget {
  final List<String> greenhouseOptions;
  final String? initialValue;
  final Function(String? newValue)? onChanged;

  const GreenhouseDropdown({
    Key? key,
    required this.greenhouseOptions,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<GreenhouseDropdown> createState() =>
      _GreenhouseDropdownState(initialValue: initialValue);
}

class _GreenhouseDropdownState extends State<GreenhouseDropdown> {
  String? selectedGreenhouse;

  _GreenhouseDropdownState({String? initialValue})
      : selectedGreenhouse = initialValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Plants'),
      value: selectedGreenhouse?.isEmpty ?? true ? null : selectedGreenhouse,
      onChanged: (String? newValue) {
        setState(() {
          selectedGreenhouse = newValue;
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        });
      },
      items: widget.greenhouseOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

