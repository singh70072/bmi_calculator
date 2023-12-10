
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtcontroller = TextEditingController();

  var ftcontroller = TextEditingController();

  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator')
      ),
      body: Container(
        color:bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('BMI', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:wtcontroller ,
                decoration: const InputDecoration(
                  labelText: 'Body Weight',
                  prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:ftcontroller ,
                decoration: const InputDecoration(
                  labelText: 'Height',
                  prefixIcon: Icon(Icons.height_outlined)
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:inchcontroller ,
                decoration: const InputDecoration(
                  labelText: 'inches',
                  prefixIcon: Icon(Icons.height_outlined)
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              var wt = wtcontroller.text.toString();
              var ft = ftcontroller.text.toString();
              var inch = inchcontroller.text.toString();


              //BMI clculation

              if(wt!="" && ft!="" && inch!=""){
                var iwt = int.parse(wt);
                var ift = int.parse(ft);
                var iInch = int.parse(inch);
                var tInch = (ift*12) + iInch;
                var tcm = tInch*2.54;
                var tM = tcm/100;
                var bmi = iwt/(tM*tM);
                var msg = '';
                if(bmi>25){
                  msg = 'You are overweight';
                  bgcolor = Colors.red;

                }
                else if(bmi<18){
                  msg = 'You are underWeight';
                  bgcolor = Colors.orange;
                }else {
                  msg = 'You are Healthy';
                  bgcolor = Colors.green;
                }
                setState(() {
                  result = '$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}';
                });
              }
              else {
                (
                  setState(() {
                    result = "Please fill all the blanks!!";
                  })
              );
              }


              },
                child: const Text('Calculate',)
            ),
            const SizedBox(height: 20,),
            Text(result, style:const TextStyle(fontSize: 15),)


          ],
        ),
      ),
    );
  }
}
