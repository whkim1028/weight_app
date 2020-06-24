import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import './ex.dart';
import './gro.dart';

class BmiResult extends StatelessWidget {
  final double height;
  final double weight;
  final String gender;

  BmiResult(this.height, this.weight, this.gender); //키와 몸무게를 받는 생성자

  @override
  Widget build(BuildContext context) {
    final String genderResult = gender;

    final bmi = weight / ((height / 100) * (height / 100));
    final bmiString =
        (weight / ((height / 100) * (height / 100))).toStringAsFixed(2);

    String _calBmi(double bmi) {
      var result = '저체중';
      if (bmi >= 35) {
        result = '고도 비만';
      } else if (bmi >= 30) {
        result = '2단계 비만';
      } else if (bmi >= 25) {
        result = '1단계 비만';
      } else if (bmi >= 23) {
        result = '과체중';
      } else if (bmi >= 18.5) {
        result = '정상';
      }
      return bmiString + '으로 ' + result + '입니다';
    }

    Widget _buildIcon(double bmi) {
      if (bmi >= 25) {
        return Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.red,
          size: 160,
        );
      } else if (bmi >= 23) {
        return Icon(
          Icons.sentiment_neutral,
          color: Colors.orange,
          size: 160,
        );
      } else if (bmi >= 18.5) {
        return Icon(
          Icons.sentiment_satisfied,
          color: Colors.green,
          size: 160,
        );
      } else {
        return Icon(
          Icons.sentiment_neutral,
          color: Colors.blueAccent,
          size: 160,
        );
      }
    }

    Widget getMyPosition(double bmi) {
      double result = (bmi -10) * MediaQuery.of(context).size.width * 0.0325;
        return Container(
          margin: EdgeInsets.only(left: result),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.arrow_upward,
                size: 30,
                color: Colors.black,
              ),
              Text('당신의 위치' , style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          )
        );
    }

    String calGoodWeight(double h) {
      var goodWeight1 = (((h / 100) * (h / 100)) * 18.5).toStringAsFixed(1);
      var goodWeight2 = (((h / 100) * (h / 100)) * 22.9).toStringAsFixed(1);

      return goodWeight1 + 'Kg' + '~' + goodWeight2 + 'Kg';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: ListView(
        children : <Widget>[
          Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            _buildIcon(bmi),
            Text(
              _calBmi(bmi),
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '당신 키의 적정 몸무게는 ' + calGoodWeight(height) + ' 입니다.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('다시하기'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10 , right: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'about BMI',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10 , right: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '키와 몸무게로 계산한 체질량 지수입니다. BMI를 근거로 한 비만의 기준은 거의 대부분의 국가에서 동일합니다. 가장 이상적인 점수는 22.0 점입니다.',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.06,
                        alignment: Alignment.topLeft,
                        child: Text(
                          'BMI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.31,
                        alignment: Alignment.topRight,
                        child: Text(
                          '18.5',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        alignment: Alignment.topRight,
                        child: Text(
                          '23',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        alignment: Alignment.topRight,
                        child: Text(
                          '25.0',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: Text(
                            '저체중',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          color: Colors.lightGreen,
                          alignment: Alignment.center,
                          child: Text(
                            '정상',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.orangeAccent,
                          alignment: Alignment.center,
                          child: Text(
                            '과체중',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            '비만',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            getMyPosition(bmi),
            Divider(
              color: Colors.black,
              thickness: 0.2,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Ex()));
                            
                      },
                      child :
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(image:new AssetImage('images/ex.png') , fit: BoxFit.cover)
                        ),
                        child: Text('운동' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.w900),),
                      ) ,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Gro(gender : genderResult , bmi: bmi,)));
                      },
                      child :
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(image:new AssetImage('images/gro.png') , fit: BoxFit.cover)
                        ),
                        child: Text('식이요법' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.w900),),
                      ) ,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        launch('https://namu.wiki/w/BMI');
                      },
                      child :
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(image:new AssetImage('images/bmi.jpeg') , fit: BoxFit.cover)
                        ),
                        child: Text('BMI 알아보기' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.w800),),
                      ) ,
                    ),
                  ],
                ),

              ],
            )
          ],
        ),
       ]
      )
    );
  }
}
