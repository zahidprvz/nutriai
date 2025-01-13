import 'package:flutter/material.dart';

class DropdownSelectorWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const DropdownSelectorWidget({
    Key? key,
    required this.hintText,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      hint: Text(hintText),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}