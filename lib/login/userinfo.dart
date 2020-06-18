import 'package:flutter/material.dart';


class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[400])
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter your Name",
                  ),
                ),
                SizedBox(height: 16,),

                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[400])
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter your Age",
                  ),
                ),

                SizedBox(height: 16,),
                DropdownButtonFormField(
                  hint: Text('Enter your Gender'),
                  onChanged: (val){
                  },
                  value:null,
                  items:[
                    DropdownMenuItem(
                      value:'male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value:'female',
                      child: Text('Female'),
                    ),

                  ],


                ),



                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[400])
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter your Email",
                  ),
                ),

                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[400])
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Enter your NID",
                  ),
                ),
                SizedBox(height: 16,),

                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("SIGNUP"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: () {

                    },
                    color: Colors.cyan,
                  ),
                )





              ],

            ),
          ),
        ),
      ),


    );
  }
}
