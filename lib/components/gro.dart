import 'package:flutter/material.dart';

class Gro extends StatelessWidget {
  final String gender;
  final double bmi;

  Gro({this.gender, this.bmi});

  @override
  Widget build(BuildContext context) {
    List<double> eatCal = calEat(gender, bmi);
    String genderLocal = '';
    if (gender == 'SingingCharacter.man') {
      genderLocal = '남성';
    } else {
      genderLocal = '여성';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '당신의 정보',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '성별 : ' +
                              genderLocal +
                              '\nBMI : ' +
                              bmi.toStringAsFixed(2) +
                              '점',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black26,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' 당신에게 권장하는 칼로리는 ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              eatCal[0].toStringAsFixed(0),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              ' ~ ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              eatCal[1].toStringAsFixed(0),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.redAccent),
                            ),
                            Text(
                              ' 칼로리 입니다.',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '다이어트를 위해서라면 ' +
                              eatCal[0].toStringAsFixed(0) +
                              '칼로리,\n대사변화가 목적이라면 ' +
                              eatCal[1].toStringAsFixed(0) +
                              '칼로리 섭취를 추천드립니다',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black26,

                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListView(
                    physics: ScrollPhysics(),
                    children: <Widget>[
                      groList(Icons.local_taxi , '이벤트 공지테스트'),
                      Divider(
                        thickness: 1,
                      ),
                      groList(Icons.local_taxi , '이벤트 공지테스트'),
                      Divider(
                        thickness: 1,
                      ),
                      groList(Icons.local_taxi , '이벤트 공지테스트1'),
                      Divider(
                        thickness: 1,
                      ),
                      groList(Icons.local_taxi , '이벤트 공지테스트'),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

List<double> calEat(String gender, double bmi) {
  double minEat = 0;
  double maxEat = 0;

  if (gender == 'SingingCharacter.man') {
    if (bmi <= 18.5) {
      minEat = bmi * 48.5;
      maxEat = bmi * 60;
    } else if (bmi > 18.5 && bmi < 25) {
      minEat = bmi * 42;
      maxEat = bmi * 58;
    } else if (bmi >= 25 && bmi < 30) {
      minEat = bmi * 40;
      maxEat = bmi * 56;
    } else if (bmi >= 30) {
      minEat = bmi * 41;
      maxEat = bmi * 50;
    }
  } else {
    if (bmi <= 18.5) {
      minEat = bmi * 45;
      maxEat = bmi * 59;
    } else if (bmi > 18.5 && bmi < 25) {
      minEat = bmi * 41;
      maxEat = bmi * 57;
    } else if (bmi >= 25 && bmi < 30) {
      minEat = bmi * 38;
      maxEat = bmi * 52;
    } else if (bmi >= 30) {
      minEat = bmi * 38.5;
      maxEat = bmi * 50;
    }
  }
  return [minEat, maxEat];
}

Widget groList(IconData icon , String text) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
  );
}

