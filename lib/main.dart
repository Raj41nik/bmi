import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade500),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var itcontroller=TextEditingController();
  var result="";
  var bgcolor=Colors.yellow.shade50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(' '),
        ),
        body: Container(
          color: bgcolor,

          child :Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('BMI',style: TextStyle(fontSize: 34,fontWeight:FontWeight.bold,color: Colors.teal ),),
              SizedBox(height: 11),
              TextField( controller:wtcontroller,
                decoration: InputDecoration(
                    label:Text('Enter your weight in KG '),
                    prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              TextField( controller:ftcontroller,
                decoration: InputDecoration(
                    label:Text('Enter your height in feet '),
                    prefixIcon: Icon(Icons.accessibility_new)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              TextField( controller:itcontroller,
                decoration: InputDecoration(
                    label:Text('Enter your height in inch '),
                    prefixIcon: Icon(Icons.accessibility_new)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: (){
                var weight=wtcontroller.text.toString();
                var feet=ftcontroller.text.toString();
                var inch=itcontroller.text.toString();

                if(weight!="" && feet!="" && inch!=""){
                  var iwt=int.parse(weight);
                  var ift=int.parse(feet);
                  var iit=int.parse(inch);
                  iit=(ift*12)+iit;
                  var tcm=iit*2.54;
                  var tmm=tcm/100;
                  var bmi=iwt/(tmm*tmm);
                  var msg='';
                  if(bmi>25){
                    bgcolor =Colors.red.shade100;
                    msg="You're Overweight";
                  }
                  else if(bmi<18){
                    bgcolor =Colors.orange.shade100;
                    msg="You're Underweight";
                  }
                  else{
                    bgcolor =Colors.green.shade100;
                    msg="You're fit !!";
                  }
                  setState(() {
                    result ='BMI = ${bmi.toStringAsFixed(2)} \n$msg ';
                  });
                }
                else{
                  setState(() {
                    result="Please fill all blank !!";
                  });
                }}, child:Text('CALCULATE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal),)),
              SizedBox(height: 15),
              Text(result,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.teal)),
            ],
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}