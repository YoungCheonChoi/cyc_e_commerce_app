import 'package:cyc_e_commerce_app/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

void validation(){
  final FormState? _form = _formkey.currentState;
  if(_form!.validate()){
    print("yes");
  }else{
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,   //전체 너비
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   Text(
                     "로그인",
                     style: TextStyle(
                     fontSize: 50,
                     fontWeight: FontWeight.bold
                   ),
                   ),
                    TextFormField(
                      validator: (value){
                        if(value==""){
                          return "이메일을 입력하세요";
                        }
                        // else if(!regExp.hasMatch(value)){  //이메일 주소 형식 검사
                        //   return "유효하지 않은 이메일 주소입니다.";
                        // }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "이메일",
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value){
                        if(value==""){
                          return "비밀번호를 입력하세요";
                        }
                        else if(value!.length < 8){
                          return "비밀번호는 8자리 이상입니다.";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "비밀번호",
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                obserText=!obserText;
                              });
                            },
                            child: Icon(
                                obserText==true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black),
                          ),
                          hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text("로그인"),
                          color:Colors.grey,
                          onPressed: (){
                          validation();
                          }),
                    ),
                    Row(
                      children: <Widget>[
                      Text("현재 계정이 없습니다."),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          //회원가입 페이지로 이동
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx)=>SignUp(),
                            ),
                          );
                        },
                          child:Text(
                            "회원가입하기",
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                      )
                    ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
