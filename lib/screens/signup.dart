import 'package:cyc_e_commerce_app/screens/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {

  void validation(){
    final FormState? _form = _formkey.currentState;
    if(_form!.validate()){
      print("yes");
    }else{
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          //key:_formkey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget> [
                      Text("회원 가입", style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),  //양쪽 마진 주기
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value){
                  if(value!.length < 6){
                    return "아이디가 너무 짧습니다.";
                  }else if(value == ""){
                    return "아이디를 입력해주세요";
                  }
                  return  "";  //아이디창 초기화
                },
                        decoration: InputDecoration(
                          hintText: "아이디",
                          hintStyle: TextStyle(
                            color: Colors.black
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                        if(value == ""){
                            return "이메일을 입력해주세요";
                          }
                          return  "";
                        },
                        decoration: InputDecoration(
                          hintText: "이메일",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,  //비밀번호 *****표시
                        validator: (value){
                          if(value == ""){
                            return "비밀번호를 입력해주세요";
                          }else if(value!.length < 8 ){
                            return "비밀번호가 너무 짧습니다.";
                          }
                          return  "";
                        },
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                                obserText == true? Icons.visibility:Icons.visibility_off,color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value == ""){
                            return "핸드폰 번호를 입력해주세요.";
                          }else if(value!.length < 8){
                            return "핸드폰 번호는 11자리여야 합니다.";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "핸드폰 번호",
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                            child:Text("회원 가입"),
                            color:Colors.blueGrey[400],
                            onPressed: (){
                              validation();
                            }),
                      ),
                      Row(
                        children: <Widget> [
                          Text("이미 계정이 존재합니다."),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              //회원가입 페이지로 이동
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx)=>Login(),
                                ),
                              );
                            },
                            child: Text(
                              "로그인", style: TextStyle(color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
             ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




