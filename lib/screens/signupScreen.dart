import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredPasswordSignUp = '';
  var _enteredPasswordConfirmSignUp = '';
  var _enteredEmailSignUp = '';
  var _enteredNameSignUp = '';
  var _enteredPhoneSignUp = '';


  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: GoogleFonts.rubik(
                    fontSize: 40, fontWeight: FontWeight.w500),
              ),
              Text(
                "Navigate with ease. Explore with confidence.",
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color.fromARGB(
                    255,
                    133,
                    133,
                    133,
                  ),
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
                      "Name",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixText: "     ",
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Name",
                      ),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your name";
                        }
                      },
                      onSaved: (value) {
                        _enteredNameSignUp = value!;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone Number",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixText: "     ",
                        border: OutlineInputBorder(),
                        hintText: "Enter phone Number",
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please a valid phone number";
                        }
                      },
                      onSaved: (value) {
                        _enteredPhoneSignUp = value!;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Email Address ",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixText: "     ",
                        border: OutlineInputBorder(),
                        hintText: "exampleone@gmail.com",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value)) {
                          return "Please Enter a valid email";
                        }
                      },
                      onSaved: (value) {
                        _enteredEmailSignUp = value!;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 15),
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
                        _enteredPasswordSignUp = value!;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Re-enter Your password",
                        prefixText: "     ",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      autocorrect: false,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 6) {
                          return "Password must be more than 6 alphabet";
                        }
                      },
                      onSaved: (value) {
                        _enteredPasswordConfirmSignUp = value!;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 16),
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
                          "Sign up",
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
