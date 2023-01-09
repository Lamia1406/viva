import 'package:flutter/material.dart';

class notFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF120D3A),
        body:Container(
          alignment: Alignment.center,
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
          child: Container(
            height: 460,
            width: 320,
              child: Stack(
              alignment: Alignment.center,
                children: [
              Image(image: AssetImage('Background4.png')),
                  Container(
                    margin: EdgeInsets.only(top: 65),
                      alignment: Alignment.topCenter,
                      child:Text(
                        "Sorry,the page you're looking \n for was not found",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'MonguSlab',
                            fontWeight: FontWeight.w700
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(top:50,right: 12),
                      alignment: Alignment.topCenter,
                      child: Image(image: AssetImage('notfound.png'),)),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(right: 20,bottom: 40),
                    child: OutlinedButton(
                      onPressed:(){
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6F2DBD),
                          padding: EdgeInsets.only(top: 23,bottom: 23,left: 20,right: 20),
                          shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(50)
                          ),
                          side: BorderSide(
                              color: Color(0xFF120D3A)
                          )


                      ),
                      child: Text(
                        "Go back",style:TextStyle(
                        fontFamily: 'MontaguSlab',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,

                      ),
                      ),
                    ),
                  ),

                ],
          ),
          ),
        )
    );
  }
}

/*
Stack(
            children: [





            ],
          )
*/
