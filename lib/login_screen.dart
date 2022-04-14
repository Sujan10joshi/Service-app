import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.lightGreen],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              _loginText(),
              const SizedBox(height: 50.0),
              _emailBlock(),
              const SizedBox(height: 20.0),
              _passwordBlock(),
              const SizedBox(height: 10.0),
              _forgetPasswordText(),
              const SizedBox(height: 5.0),
              _remeberCheckBox(),
              const SizedBox(height: 30.0),
              _loginButton(),
              const SizedBox(height: 30.0),
              _orText(),
              const SizedBox(height: 30.0),
              _loginWithLogos(),
            ],
          ),
        ),
      ),
    );
  }

  _loginText() {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        children: const [
          Text(
            'Sign In',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
        ],
      ),
    );
  }

  _emailBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Email',
          style: TextStyle(fontSize: 16.0, letterSpacing: 1.4),
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.greenAccent,
              )),
        ),
      ],
    );
  }

  _passwordBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Password',
          style: TextStyle(fontSize: 16.0, letterSpacing: 1.4),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ],
    );
  }

  _forgetPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Text(
          'Forgot Password?',
        ),
      ],
    );
  }

  _remeberCheckBox() {
    return Row(
      children: [
        Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            )),
        const Text('Remember me'),
      ],
    );
  }

  _loginButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
          child: const Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.6,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  _orText() {
    return Column(
      children: const [
        Text(
          '-OR-',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Sign in with',
          style: TextStyle(
            fontSize: 14.0,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  _loginWithLogos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CircleAvatar(
          backgroundImage: AssetImage('assets/logos/facebook.png'),
          foregroundColor: Colors.black12,
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/logos/google.png'),
          foregroundColor: Colors.black12,
          radius: 40.0,
        ),
      ],
    );
  }
}
