import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const BMIHomeScreen(),
    );
  }
}

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({super.key});

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  // Controller untuk menangkap input teks dari pengguna
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double? _bmiResult;
  String _statusMessage = 'Silakan masukkan berat dan tinggi badan Anda';
  Color _statusColor = Colors.grey;

  void _calculateBMI() {
    // Validasi input kosong
    if (_weightController.text.isEmpty || _heightController.text.isEmpty) {
      setState(() {
        _statusMessage = 'Data tidak boleh kosong!';
        _statusColor = Colors.red;
      });
      return;
    }

    // Mengubah input string menjadi double
    double weight = double.parse(_weightController.text);
    double heightCm = double.parse(_heightController.text);
    double heightM = heightCm / 100; // Konversi cm ke meter

    // Validasi angka positif
    if (heightM > 0 && weight > 0) {
      setState(() {
        // Rumus BMI: Berat (kg) / (Tinggi (m) * Tinggi (m))
        _bmiResult = weight / pow(heightM, 2);

        // Menentukan kategori BMI
        if (_bmiResult! < 18.5) {
          _statusMessage = 'Kurus (Kekurangan berat badan)';
          _statusColor = Colors.orange;
        } else if (_bmiResult! >= 18.5 && _bmiResult! < 25) {
          _statusMessage = 'Normal (Berat badan ideal)';
          _statusColor = Colors.green;
        } else if (_bmiResult! >= 25 && _bmiResult! < 30) {
          _statusMessage = 'Gemuk (Kelebihan berat badan)';
          _statusColor = Colors.orangeAccent;
        } else {
          _statusMessage = 'Obesitas';
          _statusColor = Colors.redAccent;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Berat Badan
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Berat Badan (kg)',
                prefixIcon: Icon(Icons.monitor_weight),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Input Tinggi Badan
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                prefixIcon: Icon(Icons.height),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Hitung
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('HITUNG BMI'),
            ),
            const SizedBox(height: 40),

            // Tampilan Hasil
            if (_bmiResult != null) ...[
              const Text('Skor BMI Anda:', style: TextStyle(fontSize: 18)),
              Text(
                _bmiResult!.toStringAsFixed(
                  1,
                ), // Dibulatkan 1 angka di belakang koma
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: _statusColor,
                ),
              ),
            ],

            const SizedBox(height: 10),
            Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: _statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Membersihkan controller untuk mencegah memory leak
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }
}
