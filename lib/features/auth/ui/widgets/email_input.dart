import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        icon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email can't be empty";
        }
        if (!value.contains('@')) {
          return "Invalid email";
        }
        return null;
      },
    );
  }
}
