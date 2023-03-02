import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:paw_world/bottom_navbar/bottom_navbar.dart';

import 'package:paw_world/login_signup/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  bool isLoggedIn = false;

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email Required";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please Enter a Valid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password Required";
    } else if (value.length < 6) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset("asset/petimage.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  enabled: !isLoggedIn,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18)),
                  onChanged: (String value) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Email is required."),
                    EmailValidator(errorText: "Enter valid email."),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: hidePassword,
                    controller: passwordController,
                    enabled: !isLoggedIn,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      suffixIcon: IconButton(
                        icon: Icon(hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onChanged: (String value) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Password Required"),
                      MinLengthValidator(6,
                          errorText: "Password must be atleast 6 digits long.")
                    ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 55,
                    height: 45,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  MaterialButton(
                      minWidth: 55,
                      height: 45,
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          debugPrint("Validated");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        } else {
                          debugPrint("Not Validated");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: const Color.fromARGB(255, 101, 105, 235),
                      textColor: Colors.white,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
