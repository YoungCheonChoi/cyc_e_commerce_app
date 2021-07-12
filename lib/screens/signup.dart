import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "유저 이름",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(Icons.visibility,color: Colors.black),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "아이디",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(Icons.visibility,color: Colors.black),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "비밀번호",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(Icons.visibility,color: Colors.black),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "비밀번호 확인",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(Icons.visibility,color: Colors.black),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
         ),
          ],
        ),
      ),
    );
  }
}




