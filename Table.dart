/*
import 'package:flutter/material.dart';
import 'package:viva_app/Pages/result.dart';
import 'package:viva_app/Pages/drawer.dart';
class TablePage extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xDDA663CC),
        toolbarHeight:70,
        title: Text('Form',style: TextStyle(
          color: Colors.white,
          fontSize: 38,
          fontFamily: 'MontaguSlab',
          fontWeight: FontWeight.w200
        ),),
      ),
      body:Forms()
    );
  }
}
class Forms extends StatefulWidget {
  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  var somme=0.0;
  final keys=GlobalKey<FormState>();
  TextEditingController v1=TextEditingController();
  TextEditingController v2=TextEditingController();
  TextEditingController v3=TextEditingController();
  TextEditingController v4=TextEditingController();
  TextEditingController v5=TextEditingController();
  TextEditingController v6=TextEditingController();
  TextEditingController v7=TextEditingController();
  TextEditingController v8=TextEditingController();
  TextEditingController v9=TextEditingController();
  TextEditingController v10=TextEditingController();
  TextEditingController v11=TextEditingController();
  TextEditingController v12=TextEditingController();

  Widget Column1(text,height){
    return Container(
      margin: EdgeInsets.only(left: 5),
      alignment: Alignment.centerLeft,
      height: height,
      child: Text(text),
    );
  }
  Widget Column2(text,height){
    return Container(
      alignment: Alignment.center,
      child: Text(text),
    );
  }
  Widget Column3(controller,note,height){
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 5),
      child:TextFormField(
        controller: controller,
        textDirection: TextDirection.ltr,
        textAlignVertical: TextAlignVertical.center,
        textAlign:TextAlign.center,
        onSaved: (value){
          controller.text=value;
        },
        validator:
        keyboardType:TextInputType.number,
        decoration:InputDecoration(
            border:InputBorder.none
        ) ,

        maxLines: 1,
      ) ,
    );
  }




  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: keys,
      child:ListView.builder(itemBuilder: (BuildContext context,int i){
        return  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  'Fill in the following marks:',
                  style: TextStyle(
                      color: Color(0xFF6F2DBD),
                      fontFamily: 'MontaguSlab',
                      fontSize: 18
                  ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(7.2),
                    1: FlexColumnWidth(1.4),
                    2: FlexColumnWidth(1.4),
                  }
                  ,border:TableBorder.all(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF120D3A),
                  width: 2.0,

                ),
                  children: [
                    TableRow(
                        children:[
                          Column1('Organisation du mémoire',35),
                          Column2('0.5',35),
                          Column3(v1,0.5,35),
                        ]

                    ),
                    TableRow(
                        children:[
                          Column1('Qualité rédactionnelle',35),
                          Column2('1',35),
                          Column3(v2,1,35),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Qualité de la bibliographie',35),
                          Column2('0.5',35),
                          Column3(v3,0.5,35),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Contenu scientifique : clarté de la problématique, méthodologie de travail, conclusion,....',65),
                          Column2('1',65),
                          Column3(v4,1,65),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Ergonomie / clarté de l’analyse',35),
                          Column2('1',35),
                          Column3(v5,1,35),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Effort développement / Analyse : originalité',45),
                          Column2('1',45),
                          Column3(v6,1,45),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Qualité des résultats',35),
                          Column2('1',35),
                          Column3(v7,1,35),
                        ]),
                    TableRow(
                        children:[
                          Column1('Maîtrise des outils',35),
                          Column2('1',35),
                          Column3(v8,1,35),
                        ]),
                    TableRow(
                        children:[
                          Column1('Qualité de la présentation',35),
                          Column2('1',35),
                          Column3(v9,1,35),
                        ]),
                    TableRow(
                        children:[
                          Column1('Expression orale aisée',35),
                          Column2('1',35),
                          Column3(v10,1,35),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Problématique bien posée',35),
                          Column2('1',35),
                          Column3(v11,1,35),
                        ]
                    ),
                    TableRow(
                        children:[
                          Column1('Pertinence et qualité des réponses sur le plan scientifique',45),
                          Column2('2',45),
                          Column3(v12,2,45),
                        ]
                    ),
                  ],
                ),
              ),
              Stack(
                  children:[
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(onPressed: (){
                        if(keys.currentState!.validate()){
                          keys.currentState!.save();
                          somme=double.parse(v1.text)+double.parse(v2.text)+double.parse(v3.text)+double.parse(v4.text)+double.parse(v5.text)+double.parse(v6.text)+double.parse(v7.text)+double.parse(v8.text)+double.parse(v9.text)+double.parse(v10.text)+double.parse(v11.text)+double.parse(v12.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(somme)));
                        }
                      },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFA663CC),
                              padding:EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10) ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                          child:Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 150,
                            child: Text('Calculate',style: TextStyle(
                                fontFamily: 'MontaguSlab',
                                fontSize: 21,
                                color: Colors.white
                            ),),
                          )
                      ),),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TablePage()));
                      },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding:EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10) ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(color: Color(0xFF6F2DBD))
                          ),
                          child:Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 80,
                            child: Text('Reset',style: TextStyle(
                                fontFamily: 'MontaguSlab',
                                fontSize: 21,
                                color: Color(0xFF6F2DBD)
                            ),),
                          )
                      ),),
                  ]
              )
            ]    );
      },
        itemCount: 1,
      scrollDirection: Axis.vertical,),
    ));
  }
}




 */
import 'package:flutter/material.dart';

class TablePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xDDA663CC),
          toolbarHeight: 71,
          title: Text('Form',style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontFamily: 'MontaguSlab',
              fontWeight: FontWeight.w200
          ),),
        ),
        body:SafeArea(
          child: Form(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int l){
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            'Fill in the following marks:',
                            style: TextStyle(
                                color: Color(0xFF6F2DBD),
                                fontFamily: 'MontaguSlab',
                                fontSize: 18
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Table(
                            defaultVerticalAlignment:TableCellVerticalAlignment.middle,
                            columnWidths: {
                              0: FlexColumnWidth(7.2),
                              1: FlexColumnWidth(1.4),
                              2: FlexColumnWidth(1.4),
                            }
                            ,border:TableBorder.all(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF120D3A),
                            width: 2.0,

                          ),
                            children: [
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text('Mémoire organization'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('0.5'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextFormField(
                                        validator: (controller){
          if(controller!.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('unvalid input!')));
          }
          if(double.parse(controller)> 0.5){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('unvalid input! note greater than the the full mark')));
          }
          if( double.parse(controller)<0){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('unvalid input! negative numbers are not allowed')));
          }

          else{
            return null;
          }

                                        },
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text('Editorial quality'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,

                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text('Bibliography quality'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('0.5'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Scientific content: clarity of problematic, work methodology, conclusion,....'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text('Ergonomics / clarity of analysis'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Development effort / Analysis: originality'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Quality of results'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Mastery of tools'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,

                                      ) ,
                                    ),
                                  ]),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Presentation quality'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Fluent oral expression'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,
                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Well-posed problematic'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('1'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,

                                      ) ,
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children:[
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('Relevance and quality of responses on the scientific plan'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('2'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child:TextField(
                                        textAlign: TextAlign.center,
                                        decoration:InputDecoration(
                                            border:InputBorder.none
                                        ) ,
                                        maxLines: 1,

                                      ) ,
                                    ),
                                  ]
                              ),


                            ],


                          ),
                        ),

                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFA663CC),
                                      padding:EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10) ,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(color: Color(0xFF6F2DBD))
                                  ),
                                  child:Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 150,
                                    child: Text('Calculate',style: TextStyle(
                                        fontFamily: 'MontaguSlab',
                                        fontSize: 21,
                                        color: Colors.white
                                    ),),
                                  )
                              ),),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding:EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10) ,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(color: Color(0xFF6F2DBD))
                                  ),
                                  child:Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 80,
                                    child: Text('Reset',style: TextStyle(
                                        fontFamily: 'MontaguSlab',
                                        fontSize: 21,
                                        color: Color(0xFF6F2DBD)
                                    ),),
                                  )
                              ),),
                          ],
                        ),
                        SizedBox(height: 20,)
                      ],
                    );
                  }
              )
          ),
        )
    );
  }
}


