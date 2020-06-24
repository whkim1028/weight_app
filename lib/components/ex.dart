import 'package:flutter/material.dart';

class Ex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget createWidget(
        String str1, String str2, String str3, String str4, Color headColor) {
      return Container(
        margin: EdgeInsets.only(top: 10 ,left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              str1,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: headColor),
            ),
            Text(
              str2,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black),
            ),
            Text(
              str3,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black),
            ),
            Text(
              str4,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: ListView(
          children: <Widget>[
            createWidget(
                '■ 고도비만 / 비만',
                '* 상태 : BMI 30 이상의 운동 경험이 적은 분.',
                '* 목표 : 체중조절 > 체형개선',
                '* 방법 : 살찌는 식습관 개선, 생활 악습 개선, 스트레스 관리, 체중 줄이기',
                Colors.redAccent),
            Divider(
              thickness: 0.5,
              color: Colors.blueGrey,
            ),
            createWidget(
                '■ 중도비만 / 과체중',
                '* 상태 :  BMI 23~30의 운동 경험이 적은 분 (중도비만) / 혹은 운동 경험이 매우 풍부한 분 (근육형 과체중)',
                '* 목표 : 체중조절 = 체형개선',
                '* 방법 : 좋은 식이요법 익히기 + 체중조절 + 체형개선',
                Colors.orangeAccent),
            Divider(
              thickness: 0.5,
              color: Colors.blueGrey,
            ),
            createWidget(
                '■ 정상체중',
                '* 상태 :  BMI 18.5~23 의 운동경험이 적은 분',
                '* 목표 : 체중조절 < 체형개선',
                '* 방법 : 좋은 식이요법 습관화 시키기 + 체중조절 + 체형개선에 집중',
                Colors.green),
            Divider(
              thickness: 0.5,
              color: Colors.blueGrey,
            ),
            createWidget(
                '■ 마른비만 / 저체중',
                '* 상태 :  BMI  18.5 이하의 운동경험이 적은 분',
                '* 목표 : 체성분 개선 및 체형개선',
                '* 방법 : 체중 감량의 욕심을 버리고 근육량 증강 + 체형 개선에 집중',
                Colors.blueAccent),
            Divider(
              thickness: 0.5,
              color: Colors.blueGrey,
            ),
          ],
        ));
  }
}
