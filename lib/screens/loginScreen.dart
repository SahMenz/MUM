import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mum/screens/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredPassword = '';
  var _enteredEmail = '';
  var _isLogin = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLogin
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child:
                            Image.asset("assets/images/backgroundwithlogo.jpg"),
                      ),
                      Text(
                        "Welcome to MyUnical Map.",
                        style: GoogleFonts.rubik(
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Navigate with ease. Explore with confidence.",
                        style: GoogleFonts.rubik(
                          color: const Color.fromARGB(255, 133, 133, 133),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                                decoration: const InputDecoration(
                                  prefixText: "     ",
                                  border: OutlineInputBorder(),
                                  hintText: "exampleone@gmail.com",
                                ),
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) {
                                  _enteredEmail = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                          .hasMatch(value)) {
                                    return "Please Enter a valid email";
                                  }
                                }),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Password",
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400, fontSize: 11),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "Enter Your Password",
                                prefixText: "     ",
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_red_eye),
                                ),
                              ),
                              autocorrect: false,
                              obscureText: true,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return "Password must be more than 6 alphabet";
                                }
                              },
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            const Padding(padding: EdgeInsets.only(top: 15)),
                                            Image.asset("assets/images/bottommodelline.png"),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Image.asset(
                                                "assets/images/forgottenpassword.png"),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              "Forgot Password",
                                              style: GoogleFonts.rubik(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Enter email address to get OTP for account recovery",
                                              style: GoogleFonts.rubik(
                                                  color: const Color.fromARGB(
                                                      255, 133, 133, 133),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: "exampleone@gmail.com",
                                                prefixText: "   ",
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 150,
                                                        vertical: 15),
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.0),
                                                ),
                                                side: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Text(
                                                "Get OTP",
                                                style: GoogleFonts.rubik(
                                                    color: Colors.white,
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Forgotten password ?",
                                style: GoogleFonts.rubik(color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 44,
                            ),
                            Center(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 160, vertical: 16),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                onPressed: _submit,
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: GoogleFonts.rubik(
                                    fontSize: 13,
                                    color: const Color.fromARGB(
                                        255, 133, 133, 133),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Continue with",
                                  style: GoogleFonts.rubik(),
                                ),
                                Image.asset(
                                    "assets/images/googleRectangle.png"),
                                TextButton(
                                  onPressed: () {},
                                  child:
                                      Image.asset("assets/images/google.png"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SignUpScreen());
  }
}
