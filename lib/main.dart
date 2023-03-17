import 'package:coba_flutter/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Checkboxes Demo',
      debugShowCheckedModeBanner: false,
      home: CheckboxesDemo(),
    );
  }
}

class CheckboxesDemo extends StatefulWidget {
  const CheckboxesDemo({super.key});

  @override
  State<CheckboxesDemo> createState() => _CheckboxesDemoState();
}

class _CheckboxesDemoState extends State<CheckboxesDemo> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkboxes Demo'),
        backgroundColor: const Color(0xFF6200EE),
      ),
      body: Center(
        child: GarethCheckbox(
          size: const Size(50, 50),
          value: true,
          borderColor: Colors.grey,
          boxColor: Colors.blue,
          cornerRadius: 3,
          iconSize: 30,
          iconColor: Colors.white,
          tristate: false,
          onChange: (value) {
            this.value = value!;
            log(this.value.toString(), name: "Checkbox onChange");
          },
        ),
      ),
    );
  }
}
