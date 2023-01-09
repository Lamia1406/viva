import 'package:flutter/material.dart';
import 'package:viva_app/Pages/home.dart';
import 'package:viva_app/Auth Pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Signup extends StatelessWidget {
  final keys=GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  @override
  SignUp(context) async {
   try{
    UserCredential user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    return user;
   }
   on FirebaseAuthException catch(e){
     if(e.code=='weak-password'){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("weak password")));
     }
     else if(e.code=='email-already-in-use'){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("the account already exists")));
     }
   }
   catch(e){
     print(e);
   }


  }
FieldName(text){
    return  Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 15),
      child: Text(
       text,
        style: TextStyle(
          fontFamily: 'MontaguSlab',
          fontWeight: FontWeight.w300,
          fontSize: 20,
          color: Color(0xFF120D3A),
        ),
      ),
    );
}
FieldContent(controller,validators,obscure,icon){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: TextFormField(
        controller:controller,
        onSaved: (value){
          controller.text=value;
        },
        validator: validators,
        obscureText: obscure,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        decoration: InputDecoration(
          suffixIcon: icon,
          border: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFF120D3A), width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFF0C6),
        body: SafeArea(
            maintainBottomViewPadding: true,
            child: Form(
                key: keys,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image(
                          image: AssetImage('assets/signup.png'), height: 213, width: 220,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int x){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  SizedBox(height: 10,),

                                  Text('SIGN UP',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontFamily: 'MontaguSlab',
                                          color: Color(0xFFFFC727),
                                          fontWeight: FontWeight.w600)),

                                  SizedBox(height: 10,),

                                  FieldName('Email'),
                                  FieldContent(_emailController,(controller){
                                    if(controller!.isEmpty){
                                      return 'Please fill this field';
                                    }
                                    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@univ-constantine2.dz").hasMatch(controller.toString())){
                                      return 'University email only!';
                                    }
                                    else{
                                      return null;
                                    }
                                  }, false, Icon(Icons.email, size: 17,)),
                                  SizedBox(height: 10,),
                                  FieldName('Full Name'),
                                  FieldContent(_fullNameController, (controller){
                                    if(controller!.isEmpty){
                                      return 'Please fill this field';
                                    }
                                    else if(!RegExp(r"^[a-zA-Z]").hasMatch(controller.toString())){
                                      return "Names should start with a letter";
                                    }
                                    else if(controller.toString().length<2){
                                      return 'very short name';
                                    }
                                    else if(controller.toString().length>20){
                                      return "names can't be longer than 20";
                                    }
                                    else{
                                      return null;
                                    }
                                  }, false,  Icon(Icons.person, size: 17,)),
                                  SizedBox(height: 10,),
                                  FieldName('Password'),
                                  FieldContent(_passwordController, (controller){
                                    if(controller!.isEmpty){
                                      return 'Please fill this field';
                                    }
                                    else{
                                      return null;
                                    }
                                  }, true, Icon(Icons.password)),
                                  SizedBox(height: 10,),

                                  FieldName( 'Confirm Password'),
                                  FieldContent(_confirmPasswordController, (controller){
                                    if(controller!.isEmpty){
                                      return 'Please fill this field';
                                    }
                                    else if(controller!=_passwordController.text){
                                      return "the password and confirm password field don't match";
                                    }
                                    else{
                                      return null;
                                    }
                                  }, true, Icon(Icons.password)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Already have an account? ", style: TextStyle(
                                          fontFamily: 'MontaguSlab',
                                          fontWeight: FontWeight.w200,
                                          fontSize: 14,
                                          color: Color(0xFF120D3A),
                                        ),),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                          },
                                          child: Text(
                                            'Log in',
                                            style: TextStyle(
                                              fontFamily: 'MontaguSlab',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: Color(0xFF120D3A),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: 200,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: GestureDetector(
                                      onTap:() async{
                                        if(keys.currentState!.validate()){
                                          keys.currentState!.save();
                                        UserCredential user=  await SignUp(context);
                                        if(user!=null){
                                          await FirebaseFirestore.instance.collection('users').add({
                                            'email': _emailController.text,
                                            'username': _fullNameController.text,
                                          });
                                          Navigator.of(context).pushReplacementNamed('home');
                                        }
                                        else{
                                          print('sign up failed');
                                        }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 17),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Color(0xFFFFC727)
                                        ),
                                        child: Text('Sign Up',
                                          style:
                                          TextStyle(fontSize: 20, fontFamily: 'MontaguSlab', color: Color(0xFF120D3A), fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },

                          ),
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}