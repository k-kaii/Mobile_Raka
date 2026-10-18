import 'package:flutter/material.dart';

class LayarBMI extends StatefulWidget {
  const LayarBMI({super.key});

  @override
  State<LayarBMI> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<LayarBMI> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  String _gender = 'Laki-laki'; 
  String _genderHasil = '';
  double? _hasilBMI;
  String _keterangan = "Masukkan Data Anda!!!";
  Color _warnaHasil = Colors.cyan;

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tb = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tb > 0) {
        final double tbM = tb / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        _genderHasil = _gender;

        if (_gender == 'Laki-laki') {
          if (hasil < 18.5) {
            _keterangan = "Kekurangan Berat Badan";
            _warnaHasil = Colors.orange;
          } else if (hasil <= 25) {
            _keterangan = "Berat Badan Ideal";
            _warnaHasil = Colors.green;
          } else if (hasil <= 27) {
            _keterangan = "Kelebihan Berat Badan";
            _warnaHasil = Colors.deepOrange;
          } else {
            _keterangan = "Obesitas";
            _warnaHasil = Colors.red;
          }
        } else {
          if (hasil < 17) {
            _keterangan = "Kekurangan Berat Badan";
            _warnaHasil = Colors.orange;
          } else if (hasil <= 23) {
            _keterangan = "Berat Badan Ideal";
            _warnaHasil = Colors.green;
          } else if (hasil <= 27) {
            _keterangan = "Kelebihan Berat Badan";
            _warnaHasil = Colors.deepOrange;
          } else {
            _keterangan = "Obesitas";
            _warnaHasil = Colors.red;
          }
        }
      } else {
        _hasilBMI = null;
        _genderHasil = '';
        _keterangan = 'Data Tidak Valid';
        _warnaHasil = Colors.red;
      }
    });
  }

  void _resetBMI() {
    _bbController.clear();
    _tbController.clear();
    setState(() {
      _gender = 'Laki-laki';
      _genderHasil = '';
      _hasilBMI = null;
      _keterangan = "Masukkan Data Anda!!!";
      _warnaHasil = Colors.cyan;
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(color: Colors.white, letterSpacing: 5),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        leading: Icon(Icons.accessibility, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: InputDecoration(
                  icon: Icon(Icons.people, size: 30),
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: [
                  DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                  DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
                ],
                onChanged: (nilai) {
                  setState(() {
                    _gender = nilai!;
                  });
                },
              ),
              SizedBox(height: 15),
              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.monitor_weight, size: 30),
                  labelText: 'Berat Badan (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.height, size: 30),
                  labelText: 'Tinggi Badan (cm)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _hitungBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    ),
                    child: Text('Hitung BMI'),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: _resetBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    ),
                    child: Text('Reset'),
                  ),
                ],
              ),

              SizedBox(height: 25),
              Text(
                'Hasil : ',
                style: TextStyle(letterSpacing: 5, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: _warnaHasil, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      _genderHasil == '' ? '' : 'BMI $_genderHasil',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? '--',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: _warnaHasil,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _keterangan,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _warnaHasil,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}