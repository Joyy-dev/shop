import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/offer.svg',
                  width: 30,
                  height: 30,
                ),
                Text('Best \noffer', 
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white
                ),textAlign: TextAlign.center,),
              ],
            )
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/women-shoe.svg',
                  width: 30,
                  height: 30,             
                ),
                Text(
                  'Women \nshoes',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  ), textAlign: TextAlign.center,
                )
              ]
            )
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/dress.svg',
                  width: 30,
                  height: 30,
                ),
                Text(
                  'Woman \ndress',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  ), textAlign: TextAlign.center,
                )
              ],
            )
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/men-cloth.svg',
                  width: 30,
                  height: 30,
                ),
                Text(
                  'Man \nclothes',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  ), textAlign: TextAlign.center,
                )
              ],
            )
          ),
        )
      ]
    );
  }
}