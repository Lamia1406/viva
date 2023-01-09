import 'package:flutter/material.dart';
import 'package:viva_app/Pages/home.dart';

class ResultPage extends StatefulWidget {
  var somme=0.0;
ResultPage(this.somme);
  @override
  State<ResultPage> createState() => _ResultPageState(somme);
}

class _ResultPageState extends State<ResultPage> {
  var somme=0.0;
  _ResultPageState(this.somme);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1921),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0x60120D3A),
              Color(0x603D3DDA),
              Color(0x90A663CC),
            ],
          ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 282,
                height: 172,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFED9FE8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('The Mark is:', style: TextStyle(
                          fontFamily: 'MontaguSlab',
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF120D3A),
                        ),),
                        Text('$somme/20', style: TextStyle(
                          fontFamily: 'MontaguSlab',
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF120D3A),
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 60, top: 25),
              child: ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
                });
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFED9FE8),
                      padding:EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Color(0xFFED9FE8))
                  ),
                  child:Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    child: Text('OK',style: TextStyle(
                        fontFamily: 'MontaguSlab',
                        fontSize: 21,
                        color: Color(0xFF120D3A)
                    ),),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}