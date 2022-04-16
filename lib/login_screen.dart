import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.lightGreen],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _loginText(),
                const SizedBox(height: 50.0),
                _emailBlock(),
                const SizedBox(height: 20.0),
                _passwordBlock(),
                _forgetPasswordText(),
                _remeberCheckBox(),
                const SizedBox(height: 10.0),
                _loginButton(),
                const SizedBox(height: 20.0),
                _orText(),
                const SizedBox(height: 20.0),
                _loginWithLogos(),
              ],
            ),
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
                fontFamily: 'RobotoSlab',
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
      children: [
        const Text(
          'Email',
          style: TextStyle(
              fontSize: 18.0, fontFamily: 'RobotoSlab', letterSpacing: 1.4),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          validator: validateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
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
      children: [
        const Text(
          'Password',
          style: TextStyle(
              fontSize: 18.0, fontFamily: 'RobotoSlab', letterSpacing: 1.4),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          validator: validatePassword,
          obscureText: true,
          decoration: const InputDecoration(
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
      children: [
        TextButton(
          child: const Text(
            'Forget Password?',
            style: TextStyle(
                fontFamily: 'RobotoSlab',
                color: Colors.black,
                letterSpacing: 1.2),
          ),
          onPressed: () {},
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
        const Text(
          'Remember me',
          style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 1.2),
        ),
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
              fontFamily: 'RobotoSlab',
              letterSpacing: 1.6,
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          },
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
            fontFamily: 'RobotoSlab',
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Sign in with',
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'RobotoSlab',
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

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Email is required.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return 'Invalid E-mail Format';
  }

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }
  return null;
}
