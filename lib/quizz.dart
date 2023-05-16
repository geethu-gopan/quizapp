import 'package:flutter/material.dart';
import 'package:quizapp/model_class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text(getQus(),
          style: TextStyle(color: Colors.white,fontSize: 20),
      ),
            SizedBox(height: 100,),
            Center(
              child:
            TextButton(style:TextButton.styleFrom(backgroundColor: Colors.green,fixedSize: const Size(100, 50)),
    onPressed: (){check(true);}, child: Text('True',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 30,),
            Center(child:
            TextButton(style:TextButton.styleFrom(backgroundColor: Colors.red,fixedSize: const Size(100, 50)),
                onPressed: (){check(false);}, child: Text('False',style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold),)),
        ),
      ],),
    ),
    );
  }

  List _question = [
    Quiz(qus: 'Serena Williams has one more singles tennis grant slam titles than sister venus',ans: true),
    Quiz(qus: 'Car have 4 wheels', ans: true),
    Quiz(qus: 'Bike have 3 wheels', ans: false),
    Quiz(qus: 'Sky color is blue', ans: true),
    Quiz(qus: 'Human blood color is green', ans: false),
    Quiz(qus: 'Kerala is the state of America', ans: false),
    Quiz(qus: 'India is Asian country', ans: true),
    Quiz(qus: 'Malayalam is the mother tongue of kerala', ans: true),
    Quiz(qus: 'Lionel Messi is a cricket player', ans: false),
    Quiz(qus: '125 less than 25', ans: false),
    Quiz(qus: 'Cat have 4 legs', ans: true)
  ];


  List<Icon> ico=[];
  int count=0;
  int qusNo=0;
  void nextQus(){
    if(qusNo<_question.length){
      qusNo++;
    }
  }
  String getQus(){
    return _question[qusNo].qus;
  }
  bool getAns(){
    return _question[qusNo].ans;
  }
  bool isFinished(){
    if(qusNo>=_question.length-1){
      return true;
    }
    else{
      return false;
    }
  }
  int reset(){
    qusNo=0;
    count=0;
    return qusNo;
  }
  void check(bool answer){
    bool value=getAns();
    setState(() {
      if(isFinished()==true) {
        //print ('finished');
        if (count <= 5) {
          Alert(context: context, title: 'the end', desc: 'you are failed')
              .show();
          reset();
          ico = [];
        }
        else {
          Alert(
              context: context,
              title: 'the end',
              desc: 'you are passed with $count marks').show();
          reset();
          ico=[];
        }
      }else{
        if(value==answer) {
          print(count);
          ico.add(Icon(Icons.check, color: Colors.green,));
          count++;
        }
        else{
          ico.add(Icon(Icons.close,color: Colors.red,
          ));
        }
        nextQus();
      }

    });
  }
}