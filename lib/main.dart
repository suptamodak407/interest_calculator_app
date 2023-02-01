import 'package:flutter/material.dart';

void main() {
  runApp(InterestCalculate());
}

class InterestCalculate extends StatefulWidget {
  @override
  State<InterestCalculate> createState() => _InterestCalculateState();
}

class _InterestCalculateState extends State<InterestCalculate> {
  // This widget is the root of your application.
  @override
  String display = '';
  var _corence = ['Rupees', 'Dollars', 'Pounds'];
  var _corenceitemselect = 'Rupees';
  TextEditingController principalControlled = TextEditingController();
  TextEditingController ratioControlled = TextEditingController();
  TextEditingController termControlled = TextEditingController();
  // double principal = double.parse(principalControlled.text);
  String totalcalculate() {
    double principal = double.parse(principalControlled.text);
    double ratio = double.parse(ratioControlled.text);
    double term = double.parse(termControlled.text);
    double total = principal + (principal * ratio * term) / 100;
    String result =
        'After $term Years,Your investment will be worth $total $_corenceitemselect';
    return result;
  }

  void reset() {
    principalControlled.text = '';
    ratioControlled.text = '';
    termControlled.text = '';
    _corenceitemselect = 'Rupees';
    display = '';
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Title(
              color: Colors.blue.shade900,
              child: Text('Interest Calculator',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Center(
                  child: Image(
                image: AssetImage('assets/images.jpeg'),
                width: 150,
                height: 150,
              )),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: principalControlled,
                  decoration: InputDecoration(
                    labelText: ('principal'),
                    hintText: 'Enter Ammount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ratioControlled,
                  decoration: InputDecoration(
                    labelText: 'Rate of interest',
                    hintText: 'Persent Ammount%',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Expanded(
                      child: TextField(
                        cursorWidth: 10,
                        keyboardType: TextInputType.number,
                        controller: termControlled,
                        decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Year',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(0.5),
                        items: _corence.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(child: Text(value)),
                          );
                        }).toList(),
                        value: _corenceitemselect,
                        onChanged: (String? newValueSelected) {
                          setState(() {
                            _corenceitemselect = newValueSelected!;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: (() {
                            setState(() {
                              display = totalcalculate();
                            });
                          }),
                          child: Text(
                            'Calculate',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          reset();
                        });
                      }),
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  '$display',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
