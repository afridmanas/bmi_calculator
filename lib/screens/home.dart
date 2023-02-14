import 'package:bmi_calculator/widgets/center_bar.dart';
import 'package:bmi_calculator/constants/app_constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
                //SizedBox(height: 20),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double w = double.parse(_weightController.text);
                setState(() {
                  _bmiresult = w / (h * h);
                  if (_bmiresult > 25) {
                    _textresult = "You\'re over Weight";
                  } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                    _textresult = "You have normal Weight";
                  } else if (_bmiresult < 18.5) {
                    _textresult = "You\'re under Weight";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                    color: accentHexColor.withBlue(5),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              _bmiresult.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: accentHexColor),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textresult.isNotEmpty,
              child: Container(
                child: (Text(
                  _textresult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                )),
              ),
            ),
            const SizedBox(height: 40),
            CenterBar(barwidth: 25),
            SizedBox(height: 10),
            CenterBar(barwidth: 50),
            SizedBox(height: 10),
            CenterBar(barwidth: 100),
            SizedBox(height: 10),
            CenterBar(barwidth: 150),
            SizedBox(height: 10),
            CenterBar(barwidth: 200),
            SizedBox(height: 10),
            CenterBar(barwidth: 250),
            SizedBox(height: 40),
            Text(
              "Developted by Manas Afrid",
              style: TextStyle(
                  color: accentHexColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            //Rightbar(barwidth: 50),
            //SizedBox(height: 20),
            //Rightbar(barwidth: 100),
            //SizedBox(height: 20),
            //Rightbar(barwidth: 150),
          ],
        ),
      ),
    );
  }
}
