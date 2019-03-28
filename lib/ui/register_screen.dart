import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }

}

class RegisterScreenState extends State<RegisterScreen>{
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register")
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if (value.isEmpty){
                    return "Email is required";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if (value.isEmpty && value.length < 8){
                    return "Password need to be more than or equal 8";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (value){
                  if (value.isEmpty){
                    return "Confirm Password is required";
                  }
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Register"),
                      onPressed: () {
                        auth
                        .createUserWithEmailAndPassword(
                          email: "deachnu.p@gmail.com",
                          password: "12345678",
                        )
                        .then((FirebaseUser user){
                          user.sendEmailVerification();
                          print("Return from Firebase ${user.email}");
                        }).catchError((error){
                          print("ERROR HERE -> ${error}");
                        });
                      },
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}