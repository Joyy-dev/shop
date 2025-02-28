import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLogin, this.toggleLogInState, this._isLoading, {super.key});

  final bool _isLoading;
  final bool isLogin;
  final void Function(
    String fullname,
    String email, 
    String password, 
    String username, 
    String confirmPassword, 
    bool isLogin
  ) submitFn;
  final VoidCallback toggleLogInState;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _fullname = '';
  var _email = '';
  var _password = '';
  var _username = '';
  var _confirmPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
    }
    widget.submitFn(
      _fullname,
      _email, 
      _password, 
      _username, 
      _confirmPassword,
      widget.isLogin
    );
  }

  Future<void> _forgetPassword() async {
    try {
      if (_email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a correct password')));
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password reset email sent')));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: ValueKey('fullName'),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Theme.of(context).primaryColor,),
                labelText: 'Full Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
              onSaved: (value) {
                _fullname = value!;
              },
            ),
            TextFormField(
              key: ValueKey('username'),
              decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Theme.of(context).primaryColor,),
                labelText: 'username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) {
                _username = value!;
              },
            ),
            if(widget.isLogin)
            TextFormField(
              key: ValueKey('email'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email_outlined, color: Theme.of(context).primaryColor,),
                labelText: 'email@email.com',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
            ),
            TextFormField(
              key: ValueKey('password'),
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).primaryColor,),
                labelText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              onSaved: (newValue) {
                _password = newValue!;
              },
            ),
            if (!widget.isLogin)
            TextFormField(
              key: ValueKey('confirmPassword'),
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Theme.of(context).primaryColor,),
                labelText: 'Confirm Password',
              ),
              validator: (value) {
                if (value == null || value.length < 8 || value != _password) {
                  return 'Incorrect password or password must be at least 8 characters long';
                }
                return null;
              },
              onSaved: (newValue) {
                _confirmPassword = newValue!;
              },
            ),
            const SizedBox(height: 10,),
            if (widget.isLogin)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _forgetPassword, 
                  child: Text('forget password ?')
                )
              ]
            ),
            const SizedBox(height: 10,),
            if (widget._isLoading)
            CircularProgressIndicator(),
            if (!widget._isLoading)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white
                  ),
                  onPressed: _trySubmit, 
                  child: Text(widget.isLogin ? 'Sign In' : 'Sign Up'),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: widget.toggleLogInState, 
                  child: Text(widget.isLogin ? 'Don\'t have an account? sign Up' : 'Already have an account? Sign In'),
                )
              ],
            )
        
          ]
        ),
      )
    );
  }
}