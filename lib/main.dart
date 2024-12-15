import 'package:flutter/material.dart';
import 'package:phone_auth/function/auth.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),

    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  final _formkey = GlobalKey<FormState>();

  bool isLogin=false;
  String email = '';
  String password = '';
  String username = '';

  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Email/pass Auth")),
        // backgroundColor: Colors.purple.shade800,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin ? TextFormField(
                controller: emailController,
                key: ValueKey('username'),
                decoration: InputDecoration(
                  hintText: "enter user name",
                ),
                validator: (value) {
                  if (value.toString().length < 3) {
                    return 'Username is so small';
                  } else {
                    return null;
                  }
                },
              ):Container(),
              TextFormField(
                controller: emailController,
                key: ValueKey('Email'),
                decoration: InputDecoration(
                  hintText: "enter email",
                  hoverColor: Colors.purple.shade800,
                ),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                key: ValueKey('password'),
                decoration: InputDecoration(
                  hintText: "enter password",
                ),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return 'Password is so small';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    isLogin
                        ? signin(email, password)
                        : signup(email, password);
                  }
                },
                    child: isLogin?Text("Login",
                      style: TextStyle(fontSize: 20),): Text("SignUp",
                    style: TextStyle(fontSize: 20),
                    ),
                ),
              ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                setState(() {
                  isLogin=!isLogin;
                });
              },
                  child: isLogin ? Text("Don't have an Account ? Signup"): Text("Already signed up? login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}




