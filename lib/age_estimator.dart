import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AgeEstimatorApp extends StatefulWidget {
  const AgeEstimatorApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgeEstimatorAppState createState() => _AgeEstimatorAppState();
}

class _AgeEstimatorAppState extends State<AgeEstimatorApp> {
  late DateTime _selectedDate;
  String _age = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light().copyWith(
              primary: Colors.blue, // Cor do texto do botão "Confirmar"
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _calculateAge();
      });
    }
  }

  void _calculateAge() {
    final now = DateTime.now();
    final age = now.year - _selectedDate.year;
    setState(() {
      _age = 'Idade estimada: $age anos';
    });
  }

  void _resetFields() {
    setState(() {
      _selectedDate = DateTime.now();
      _calculateAge();
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _calculateAge();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estimativa de Idade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selecione a data de nascimento:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                DateFormat('dd/MM/yyyy').format(_selectedDate),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _age,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetFields,
              child: const Text(
                'Limpar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
