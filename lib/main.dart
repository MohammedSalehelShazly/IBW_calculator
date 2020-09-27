import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBW Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IBW_Calculator(),
    );
  }
}



double scrollSlider =150.0;
double height = scrollSlider;
String sex ="Male";
int myWeight = 50;
int myAge = 25;

String selactedLanguage = "";
String highTitle = "HIGHT";
String ageTitle = "Age";
String weightTitle = "WEIGHT";
String maleTitle = "MALE";
String femaleTitle = "FEMALE";
String buttonCalcTitle = "CALCULATE";
String buttonReCalcTitle = "Re-CALCULATE";
String appbarTitle =  "IBW CALCULATE";


myContainer(List<Widget> thisContante ){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: thisContante
            )
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30
        ),
      ),
    ),
  );
}

TextStyle myTextStyle([int size=20]){
  return TextStyle(color: Colors.white ,fontSize: size.toDouble() ,);
}

class IBW_Calculator extends StatefulWidget {
  @override
  _IBW_CalculatorState createState() => _IBW_CalculatorState();
}
class _IBW_CalculatorState extends State<IBW_Calculator> {


  sexContainer(List<Widget> thisContante , _sex){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: (){
            setState(() {
              _sex=="Male" ? sex = _sex : sex ;
              _sex=="FeMale" ? sex =  _sex : sex ;
            });
          },
          child: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: thisContante
                )
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white30
            ),
          ),
        ),
      ),
    );
  }


  changingButton({bool increase ,bool isWeight , bool increaseWeight , bool increaseAge}){
    return InkWell(
      onTap: (){
        setState(() {
          if(increase== true && isWeight==true && increaseWeight== true && increaseAge== false){
            myWeight++;
          }if(increase==false &&isWeight==true && increaseWeight==false && increaseAge==false){
            myWeight-- ;
          }
          if(increase== true && isWeight==false && increaseWeight== false && increaseAge== true){
            myAge++ ;
          }if(increase==false &&isWeight==false && increaseWeight==false && increaseAge==false){
            myAge-- ;
          }
        });},
      child: CircleAvatar(
        backgroundColor: Colors.white24,
        child: increase==true ? Icon(Icons.add , color: Colors.white,) : Icon(Icons.remove ,color: Colors.white) ,
      ),
    );
  }

  _OutputState obj = _OutputState();
  var obj2 = Output();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(backgroundColor: Colors.white30,title: Text(appbarTitle ,style: myTextStyle(30),), centerTitle: true,automaticallyImplyLeading: false),

      body:Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  sexContainer(
                      [

                        Image.network("https://cdn2.iconfinder.com/data/icons/font-awesome/1792/male-128.png" , width: 75,height: 75,color: Colors.white,),
                        Text(maleTitle , style: myTextStyle(),)
                      ] , "Male"
                  ),
                  sexContainer(
                      [
                        Image.network("https://cdn2.iconfinder.com/data/icons/font-awesome/1792/female-128.png" , width: 75,height: 75,color: Colors.white,),
                        Text(femaleTitle , style: myTextStyle(),)
                      ], "FeMale"
                  ),
                ],
              ),
            ),
            myContainer(
                [
                  Text(highTitle, style: myTextStyle(),),
                  Text("${scrollSlider.toInt()}", style: myTextStyle(40)),
                  Slider(
                    value: scrollSlider ,
                    max: 250,min: 50,
                    //label: "${scrollSlider.toInt()}",
                    divisions: 250,
                    onChanged: (selector){
                      setState(() {
                        scrollSlider = selector;
                      });
                    },
                    onChangeEnd: (endSelect){
                      setState(() {
                        height = endSelect;
                      });
                    },
                  )
                ]
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  myContainer(
                      [
                        Text(weightTitle , style: myTextStyle(),),
                        Text("$myWeight" , style: myTextStyle(50),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            changingButton(increase: false ,isWeight:true , increaseWeight: false , increaseAge: false),
                            changingButton(increase: true , isWeight:true , increaseWeight: true , increaseAge: false)
                          ],
                        )
                      ]
                  ),
                  myContainer(
                      [
                        Text(ageTitle , style: myTextStyle(),),
                        Text("$myAge" , style: myTextStyle(50),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            changingButton(increase: false ,isWeight:false , increaseWeight: false , increaseAge: false),
                            changingButton(increase: true ,isWeight:false , increaseWeight: false , increaseAge: true)
                          ],
                        )
                      ]
                  ),
                ],
              ),
            ),
            ButtonTheme(
              minWidth: double.infinity,height: 50,
              child: RaisedButton(
                  color: Colors.red,
                  child: Text(buttonCalcTitle , style: myTextStyle(),),
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Output(),
                        ),
                      );
                    });
                  }
              ),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(selactedLanguage , style: TextStyle(fontSize: 30),),
              Text("Language  /  اللغة") ,
              Divider(indent: 20,endIndent: 20,color: Colors.red,),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: ButtonTheme(
                  height: 50, minWidth: MediaQuery.of(context).size.width * 0.7 ,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        selactedLanguage = "English" ;
                        highTitle = "HIGHT";
                        ageTitle = "AGE";
                        weightTitle = "WEIGHT";
                        maleTitle ="MALE";
                        femaleTitle = "FEMALE";
                        buttonCalcTitle = "BMI CALCULTE";
                        buttonReCalcTitle = "Re-CALCULATE";
                        appbarTitle = "CALCULTE";
                        obj.allCasesTitle = {                           // ass line 278
                          "case1":"Very severely underweight" ,
                          "case2":"Severely underweight" ,
                          "case3":"Underweight" ,
                          "case4":"Normal (healthy weight)" ,
                          "case5":"Overweight" ,
                          "case6":"Moderately obese" ,
                          "case7":"Severely obese" ,
                          "case8":"Moderately obese" ,
                          "case9":"Severely obese" ,
                        };
                      });
                    },
                    child: Text("English"),
                    color: Colors.black12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  height: 50,minWidth: MediaQuery.of(context).size.width *0.7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        selactedLanguage = "Arabic" ;
                        highTitle = "الطـول";
                        ageTitle = "السـنّ";
                        weightTitle = "الـوزن";
                        maleTitle ="ذكـر";
                        femaleTitle = "أنثـى";
                        buttonCalcTitle = "أحســب";
                        buttonReCalcTitle = "أعادة الحسـبه";
                        appbarTitle = "حاسبــة الوزن المثالي";

                        obj.allCasesTitle = {                         // not work!!....ask how to update class's variable in another class
                          "case1": "نقص الوزن الشديد جدًا" ,
                          "case2": "نقص الوزن الشديد" ,
                          "case3": "نقص الوزن" ,
                          "case4": "عادي (وزن صحي)" ,
                          "case5": "زيادة الوزن" ,
                          "case6": "سمنة معتدلة" ,
                          "case7": "سمنة شديدة" ,
                          "case8": "سمنة معتدلة" ,
                          "case9": "السمنة المفرطة" ,
                        } ;
                      });
                    },
                    child: Text("العربية"),
                    color: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Output extends StatefulWidget {

  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Text("Your Result"),
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            myContainer([
              //Text("<<<Your Chosen are>>>\nSex=$sex  \nHeight=${height.toInt()} CM  \nWeight=$myWeight KG  \nAge=$myAge Years" , style: TextStyle(fontSize: 25, color: Colors.grey),textAlign: TextAlign.center,),
              Text("${YouridealWeight.round()}" ,  style:myTextStyle(30)),
              Text("${checkResult()}" ,  style:myTextStyle(30)),
              Divider(height: 15,thickness: 2 , color: Colors.white,indent: 25,endIndent: 25),
            ]),
            ButtonTheme(
              minWidth: double.infinity,height: 50,
              child: RaisedButton(
                color: Colors.red,
                child: Text(buttonReCalcTitle , style: myTextStyle(),),
                onPressed: (){
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  double YouridealWeight = myWeight / (  pow((height/100),2)   );
  String checkResultTitle = "";
  Map allCasesTitle = {
    "case1":"Very severely underweight" ,
    "case2":"Severely underweight" ,
    "case3":"Underweight" ,
    "case4":"Normal (healthy weight)" ,
    "case5":"Overweight" ,
    "case6":"Moderately obese" ,
    "case7":"Severely obese" ,
    "case8":"Moderately obese" ,
    "case9":"Severely obese" ,
  };
  checkResult() {
    if (YouridealWeight < 15) return checkResultTitle = allCasesTitle["case1"] ;
    if (YouridealWeight > 15 && YouridealWeight < 16) return checkResultTitle = allCasesTitle["case2"];
    if (YouridealWeight > 16 && YouridealWeight < 18.5) return checkResultTitle = allCasesTitle["case3"];
    if (YouridealWeight > 18.5 && YouridealWeight < 25) return checkResultTitle = allCasesTitle["case4"];
    if (YouridealWeight > 25 && YouridealWeight < 30) return checkResultTitle = allCasesTitle["case5"];
    if (YouridealWeight > 30 && YouridealWeight < 35) return checkResultTitle = allCasesTitle["case6"];
    if (YouridealWeight > 35 && YouridealWeight < 40) return checkResultTitle = allCasesTitle["case7"];
    if (YouridealWeight > 30 && YouridealWeight < 35) return checkResultTitle = allCasesTitle["case8"];
    if (YouridealWeight > 35 && YouridealWeight < 40) return checkResultTitle = allCasesTitle["case9"];
    if(YouridealWeight>40) return checkResultTitle="Very severely obese";
  }
}