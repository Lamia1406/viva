import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viva_app/Pages/ResultViva.dart';
import 'package:viva_app/Pages/drawer.dart';
class VivaMarkPage1 extends StatefulWidget {
  const VivaMarkPage1({Key? key}) : super(key: key);
  @override
  State<VivaMarkPage1> createState() => _VivaMarkPage1State();
}

class _VivaMarkPage1State extends State<VivaMarkPage1> {
  final formKey = GlobalKey<FormState>();
  TextEditingController projectName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController firstStudent = TextEditingController();
  TextEditingController secondStudent = TextEditingController();
  TextEditingController thirdStudent = TextEditingController();
  TextEditingController supervisorName = TextEditingController();
  TextEditingController supervisorMark = TextEditingController();
  TextEditingController presidentName = TextEditingController();
  TextEditingController presidentMark = TextEditingController();
  TextEditingController examinatorName = TextEditingController();
  TextEditingController examinatorMark = TextEditingController();
  FieldName(name) {
    return Container(
      margin: EdgeInsets.only(left: 40.0, top: 7.0),
      child: Text(
        name,
        style: TextStyle(
            color: Color(0xFF120D3A), fontFamily: 'MontaguSlab', fontSize: 12),
      ),
    );
  }

  FieldContent(hintText, controller, validators) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.0),
      child: TextFormField(
        controller: controller,
        onSaved: (value) => {controller.text=value},
        validator: validators,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF120D3A), width: 22.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF120D3A), width: 2.0),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
@override
 String prjctName = '';
  String supMark = '';
  String pstMark = '';
  String exmMark = '';
  String vivaMark = '';
  @override
  addProjectData() async {
    FirebaseFirestore.instance.collection("projects").add({
      "project name": "${projectName.text}",
      'year':double.parse(year.text),
      'students': ["${firstStudent.text}","${secondStudent.text}","${thirdStudent.text}"],
      'superviser': "${supervisorName.text}",
      "superviser's mark":double.parse(supervisorMark.text),
      'president': "${presidentName.text}",
      "president's mark":double.parse(presidentMark.text),
      'examinator': "${examinatorName.text}",
      "examinator's mark":double.parse(examinatorMark.text),
      'final mark': vivaMark,
    });
        }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xDDA663CC),
        toolbarHeight: 71,
        title: Text(
          'Viva Project',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'MontaguSlab',
              fontWeight: FontWeight.w200),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Form(
            key: formKey,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (BuildContext context, int n) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          'Fill in the following information:',
                          style: TextStyle(
                              color: Color(0xFF6F2DBD),
                              fontFamily: 'MontaguSlab',
                              fontSize: 14),
                        ),
                      ),
                      FieldName('Project Name:'),
                      FieldContent('Type a text..', projectName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        return null;
                      }),
                      FieldName('Year:'),
                      FieldContent('ex: 2023', year, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if (double.parse(value!) > DateTime.now().year) {
                          return "you can't input dates that are in the future";
                        }

                        return null;
                      }),
                      FieldName('First Student Full Name:'),
                      FieldContent('Type a text..', firstStudent, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if((value!)==thirdStudent.text || (value!)== secondStudent.text){
                          return "you can't put the same name more than once in the fields";
                        }
                        return null;
                      }),
                      FieldName('Second Student Full Name (optional):'),
                      FieldContent('Type a text..', secondStudent, (value){
                        if(value.isNotEmpty && (value==firstStudent.text || value== thirdStudent.text)){
                          return "you can't put the same name more than once in the fields";
                        }
                      }),
                      FieldName('Third Student Full Name (optional):'),
                      FieldContent('Type a text..', thirdStudent,(value){
                        if(value.isNotEmpty && (value==firstStudent.text || value== secondStudent.text)){
                          return "you can't put the same name more than once in the fields";
                        }
                      }),
                      FieldName("Supervisor's Full Name: "),
                      FieldContent('Type a text..', supervisorName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if(value==presidentName.text || value==examinatorName.text){
                          return 'The jury can not have more than one position';
                        }
                        return null;
                      }),

                      FieldName("Supervisor's Mark: "),
                      FieldContent('Type a number..', supervisorMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if(double.parse(value)>20){
                          return "The full mark is 20/20, you can't go above that";
                        }
                        if(double.parse(value)<0){
                          return "Negative values are not allowed";
                        }
                        return null;
                      }),

                      FieldName(
                        "Viva President's Full Name: ",
                      ),
                      FieldContent('Type a text..', presidentName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if(value==supervisorName.text || value==examinatorName.text){
                          return 'The jury can not have more than one position';
                        }

                        return null;
                      }),

                      FieldName(
                        "Viva President's Mark: ",
                      ),
                      FieldContent('Type a number..', presidentMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if(double.parse(value)>20){
                          return "The full mark is 20/20, you can't go above that";
                        }
                        if(double.parse(value)<0){
                          return "Negative values are not allowed";
                        }
                        return null;
                      }),

                      FieldName(
                        "Examinator's Full Name: ",
                      ),
                      FieldContent('Type a text..', examinatorName, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if(value==presidentName.text || value==supervisorName.text){
                          return 'The jury can not have more than one position';
                        }
                        return null;
                      }),

                      FieldName(
                        "Examinator's Mark: ",
                      ),
                      FieldContent('Type a number..', examinatorMark, (value) {
                        if (value!.isEmpty) {
                          return 'please fill this field';
                        }
                        if(double.parse(value)>20){
                          return "The full mark is 20/20, you can't go above that";
                        }
                        if(double.parse(value)<0){
                          return "Negative values are not allowed";
                        }
                        return null;
                      }),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(right: 30, top: 10, bottom: 20),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                vivaMark=((double.parse(supervisorMark.text) * 6 +
                                    double.parse(presidentMark.text) * 6 +
                                    double.parse(examinatorMark.text) * 8) / 20).toString();
                                await addProjectData();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ResultViva(
                                      prjctName: prjctName, supMark: supMark, pstMark: pstMark, exmMark: exmMark, vivaMark: vivaMark,
                                    )));
                              }

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFA663CC),
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(color: Color(0xFFA663CC))),
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 180,
                              child: Text(
                                'Calculate Viva',
                                style: TextStyle(
                                    fontFamily: 'MontaguSlab',
                                    fontSize: 21,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

