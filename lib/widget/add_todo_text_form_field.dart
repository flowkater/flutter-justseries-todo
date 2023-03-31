import 'package:flutter/material.dart';

class AddTodoTextFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onFieldSubmitted;

  const AddTodoTextFormField({
    required this.onChanged,
    required this.onFieldSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const SizedBox(
            child: Icon(Icons.add),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              onFieldSubmitted: onFieldSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
