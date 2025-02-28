import 'package:ecommerce/screens/auth_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _navigateToAuthScreen(BuildContext context) {
    FirebaseAuth.instance.currentUser;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthScreens()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFEBF6FF)
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/images/online-shopping-concept.svg')
              ),
              Column(
                children: [
                  Text('Lady D',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,),
                  Text('Your one-stop destination for stylish and trendy fashion! Whether you\'re shopping for men, women, babies, or teens, we\'ve got something for everyone. From casual everyday looks to special occasion outfits, we offer a wide range of high-quality styles that cater to every age and personality. Explore our collection and find your perfect fit today!',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,),
                ],
              ),     
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    alignment: Alignment.center,
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  onPressed: () => _navigateToAuthScreen(context),
                  child: Text('Get Started')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}