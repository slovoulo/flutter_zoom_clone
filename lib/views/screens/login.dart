import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/models/usermodel.dart';
import 'package:flutter_zoom_clone/providers/auth_provider.dart';
import 'package:flutter_zoom_clone/views/screens/home.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggingin=false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
 navigateHome(){
   Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                               
                                                builder: (context) =>
                                                   const HomePage(
                                                      
                                                    )));
 }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserDetails userVM = UserDetails();
  bool _passwordVisible = false;
  

  @override
  Widget build(BuildContext context) {
    final loginNotifier=Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              TextFormField(
                controller: emailController,

                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                    labelText: "Username", hintText: "Your username"),
                    
                onChanged: (value) {
                  var vl=userVM.username;
                  if(vl != null){userVM.username = value;}
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide a username";
                  }
                },
              ),
              const SizedBox(height: 20,),TextFormField(
                controller: passwordController,
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
                  userVM.password = value!;
                },
              ),
              ElevatedButton(
                  onPressed: () {

                    loginNotifier.login(emailController.text,passwordController.text,navigateHome);
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
