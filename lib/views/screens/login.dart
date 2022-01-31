import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/view_models/user_view_model.dart';
import 'package:flutter_zoom_clone/views/screens/home.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
  
}

class _LandingPageState extends State<LandingPage> {
  bool isLoggingin=false;
  
  login()async{
    var useremail=userVM.user?.email;
    final userCredentials=userVM.user?.firebaseauth.signInWithEmailAndPassword(email: userVM.user!.email, password: userVM.user!.password);
    isLoggingin?null:(){
      isLoggingin=true;
      if(userCredentials!=null){
        Navigator.pushReplacement(
                             context, MaterialPageRoute(builder: (context)=>HomePage()));
                         
      }
    };


  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserViewModel userVM = UserViewModel();
  bool _passwordVisible = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              TextFormField(

                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                    labelText: "Username", hintText: "Your username"),
                    
                onChanged: (value) {
                  var vl=userVM.user?.username;
                  if(vl != null){userVM.user!.username = value;}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide a username";
                  }
                },
              ),
              SizedBox(height: 20,),TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                onSaved: (value) {
                  userVM.user!.password = value!;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    adduser();
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
