import 'package:flutter/material.dart';

class ResultViva extends StatefulWidget {

  String prjctName='';
  String supMark='';
  String pstMark='';
  String exmMark='';
  String vivaMark='';

  ResultViva({required this.prjctName, required this.supMark, required this.pstMark, required this.exmMark, required this.vivaMark,});

  @override
  State<ResultViva> createState() => _ResultVivaState(prjctName, supMark, pstMark, exmMark, vivaMark);
}

class _ResultVivaState extends State<ResultViva> {
  String prjctName='';
  String supMark='';
  String pstMark='';
  String exmMark='';
  String vivaMark='';
  _ResultVivaState(this.prjctName, this.supMark, this.pstMark, this.exmMark, this.vivaMark);

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
                height: 332,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBB4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Project Name:', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('$prjctName', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Supervisor’s Mark: ', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                            Text('$supMark /20', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('President’s Mark: ', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                            Text('$pstMark /20', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Examinator’s Mark: ', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                            Text('$exmMark /20', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('The Viva’s Mark:', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$vivaMark /20', style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF120D3A),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 60, top: 25),
              child: ElevatedButton(onPressed: (){

                  Navigator.of(context).pushReplacementNamed('home');
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFEBB4),
                      padding:EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Color(0xFFFFEBB4))
                  ),
                  child:Container(
                    alignment: Alignment.center,
                    height: 37,
                    width: 87,
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