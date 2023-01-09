import 'package:flutter/material.dart';

class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x60120D3A),
            Color(0x603D3DDA),
            Color(0x90A663CC),
          ],
        ),),
      child: Stack(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 50),
                child:Image(image: AssetImage('assets/Background1.png'),height:383,width: 224,)
            ),
          ),
          Expanded(child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 100),
              child: Image(image: AssetImage('assets/Welcome1.png'),height: 280.05,width: 256,)
          ),
          ),

          Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top:50),
              child: Image(image: AssetImage('assets/Background1_2.png'),height: 345,width: 50,)),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 320),
            child: Text(
              'Fast Calculate!',style:TextStyle(
                fontFamily: 'MontaguSlab',
                fontSize: 31,
                fontWeight: FontWeight.w700,
                color: Color(0xFFEBEBEB)

            ),
            ),
          ),
        ],
      ),
    );
  }
}