import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/widget/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  final _auth = FirebaseAuth.instance;
  bool isLogin = true;
  var _isLoading = false;

  void _toggleLogInState() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void sendEmailVerification(User user) async {
    try {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch(error) {
      rethrow;
    }
  }

  void _onSubmit(
    String fullname,
    String email, 
    String password,
    String username,
    String confirmPassword,
    bool isLogin,
  ) async {
    UserCredential authresult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
      authresult = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    } else {
      if (password != confirmPassword) {
        throw FirebaseAuthException(
          code: 'Password-mismatch',
          message: 'Password do not match'
        );
      }
      authresult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      await FirebaseFirestore.instance.collection('users').doc(authresult.user!.uid).set({
        'username': username,
        'email': email
      });

      if (authresult.user != null && authresult.user!.emailVerified) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen()
          )
        );
      }
    } 
    } on FirebaseAuthException catch (e) {
      var message = 'An error occured please check your credentials';
      if (e.message != null) {
        message = e.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(isLogin ? 'Sign In' : 'Sign Up'),
      ),
      body: Column(
        children: [
          Text(isLogin ? 'Welcome To Lady D world 🌹' : 'Welcome back Mate! 😊',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(isLogin ? 'We welcome you to Lady D world. Home of fashion and confidences, sign up to start shopping with us' : 'We are glad to have you back continue shoping from where you left'),
          AuthForm(_onSubmit, isLogin, _toggleLogInState, _isLoading),
        ],
      ),
    );
  }
}