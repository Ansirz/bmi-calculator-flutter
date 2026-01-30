import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: BMICalculator(),
));
class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 0;
  double weight = 0;
  String result = " ";
  double bmiScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "BMI Calculator"
        ),
        backgroundColor: Colors.grey[600],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            children: [
              SizedBox(
                width: 300.0,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      height = double.tryParse(value) ?? 0.0;
                      height /= 100;
                      
                    });
                  },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter your height",
                    suffixText: "cm"
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
                SizedBox(
                width: 300.0,
                child: TextField(
                onChanged: (value) {
                  setState(() {
                     weight = double.tryParse(value) ?? 0.0;
                  });
                },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter your weight",
                    suffixText: "kg"
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 129, 22, 22)
                ),
                onPressed: (){
                  setState(() {
                    result = "Your Body Mass Index is $bmiScore";
                    bmiScore = weight/(height*height);
                  });
                }, 
                child: Text(
                  "Generate Results",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                 " Your BMI is ${bmiScore.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 20.0
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}