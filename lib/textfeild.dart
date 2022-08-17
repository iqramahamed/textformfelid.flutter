import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:textformfeild/homepage.dart';

class TextFeildDemo extends StatefulWidget {
  const TextFeildDemo({Key? key}) : super(key: key);

  @override
  State<TextFeildDemo> createState() => _TextFeildDemoState();
}

class _TextFeildDemoState extends State<TextFeildDemo> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.tealAccent,
        child: Form(
          key: _formkey,
          child: Column(children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Email";
                }

                if (!value.contains("@")) {
                  return "Invalid Email";
                }
              },
              //obscuringCharacter: #, which type of character i am wanting
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                ),
                suffixIcon: Icon(Icons.visibility),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.9),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )),
                hintText: "Demoemail@gmail.com",
                labelText: "Enter your email",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),

            // password

            SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: _isObsecure,
              //true, //for hiding characters
              maxLength: 6,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Passwrod";
                }

                if (value.length < 3) {
                  return "Password too Short";
                }

                if (value.length > 10) {
                  return "Password too Long";
                }
              },

              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObsecure = !_isObsecure;
                    });
                  },
                  icon: Icon(
                    _isObsecure == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  color: Colors.indigo,
                ),
                //  suffixIcon: Icon(Icons.visibility),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.9),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )),
                hintText: "Ab12@#",
                labelText: "Enter your password",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => HomePage(
                            emailController.text, passwordController.text))));
                    print("Everything is Fine");
                  } else {
                    print("Something wrong");
                  }
                },
                icon: Icon(
                  Icons.heart_broken,
                )),
          ]),
        ),
      ),
    );
  }
}
