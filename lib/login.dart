import 'package:flutter/material.dart';
import 'package:flutter_latihan_kuis/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isLoginSucess = true;

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/makeup-accessories-background.png',
                  height: 150, width: 150),
              _usernamefield(),
              _passwordfield(),
              _loginbutton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernamefield() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        enabled: true,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: const InputDecoration(
            hintText: "Username",
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 233, 138, 169)))),
      ),
    );
  }

  Widget _passwordfield() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        obscureText: true, // Makes the password obscure
        enabled: true,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: const InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 233, 138, 169)))),
      ),
    );
  }

  Widget _loginbutton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  (isLoginSucess) ? Colors.pinkAccent : Colors.red),
          onPressed: () {
            String text = "";
            if (password == "123") {
              setState(() {
                isLoginSucess = true;
                text = "Login Success";
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage(username: username);
              }));
            } else {
              setState(() {
                isLoginSucess = false;
                text = "Login Failed";
              });
            }
            SnackBar snackbar = SnackBar(
              content: Text(text),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: const Text('Login')),
    );
  }
}
