import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  TextEditingController _birthDateController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('만 나이 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '생년월일을 입력하세요',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _birthDateController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              onChanged: (_) => _calculateAge(),
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: '예: 20241225',
                hintText: '생년월일을 입력하세요',
                counterText: '',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _result.isEmpty
                ? Container()
                : Text(
              '만 나이: $_result세',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateAge() {
    String birthDate = _birthDateController.text;

    if (birthDate.length != 8) {
      setState(() {
        _result = '';
      });
      return;
    }

    int birthYear = int.tryParse(birthDate.substring(0, 4)) ?? 0;
    int birthMonth = int.tryParse(birthDate.substring(4, 6)) ?? 1;
    int birthDay = int.tryParse(birthDate.substring(6, 8)) ?? 1;

    DateTime currentDate = DateTime.now();
    DateTime birthday = DateTime(birthYear, birthMonth, birthDay);

    int age = currentDate.year -
        birthday.year -
        (currentDate.month > birthday.month ||
            (currentDate.month == birthday.month &&
                currentDate.day >= birthday.day)
            ? 0
            : 1);

    setState(() {
      _result = age.toString();
    });
  }
}
