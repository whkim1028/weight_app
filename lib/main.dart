import 'package:flutter/material.dart';
import './components/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BmiMain(title: '비만도 계산기'),
    );
  }
}

class BmiMain extends StatefulWidget {
  BmiMain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BmiMain createState() => _BmiMain();
}

enum SingingCharacter { man, fman }

class _BmiMain extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 얻기 위한 키

  final _heightController =
      TextEditingController(); //키의 입력값을 받아 로직처리 하기 위한 컨트롤러 선언
  final _weightController =
      TextEditingController(); //몸무게 입력값을 받아 로직처리 하기 위한 컨트롤러 선언
  FocusNode myFocusNode;

  SingingCharacter _gender = SingingCharacter.man;

  //텍스트 에디팅 컨트롤러는 반드시 dispose 시에 dispose 되도록 선언하여야 한다.
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all((16.0)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: '키'),
                    controller: _heightController,
                    autofocus: true,
                    focusNode: myFocusNode,
                    keyboardType: TextInputType.number,
                    //숫자만 입력 가능
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return '키를 입력하세요';
                      }
                      return null;
                    },
                  )),
              SizedBox(
                height: 16.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: '몸무게'),
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return '몸무게를 입력하세요';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ListTile(
                      title: Text('남자'),
                      leading: Radio(
                        value: SingingCharacter.man,
                        groupValue: _gender, //radio이므로 Gender class의 참조변수를 갖는다.
                        onChanged: (value) {
                          setState(() {
                            //setState()은 ui변경가능
                            _gender = value; //남자 클릭시 Man의 값이 들어간다.
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('여자'),
                      leading: Radio(
                        value: SingingCharacter.fman,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(myFocusNode);
                    //폼에 입력된 값 검증
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiResult(
                                    double.parse(_heightController.text.trim()),
                                    double.parse(_weightController.text.trim()),
                                    _gender.toString()
                                  ))).then((value) => {
                            _heightController.text = '',
                            _weightController.text = '',
                          });
                    }
                  },
                  child: Text('결과 보기'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
