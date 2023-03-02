import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:paw_world/login_signup/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool hidePassword1 = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

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
    } else if (value != passwordController.text) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
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
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Password Required"),
                      MinLengthValidator(6,
                          errorText: "Password must be atleast 6 digits long.")
                    ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: hidePassword1,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      suffixIcon: IconButton(
                        icon: Icon(hidePassword1
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            hidePassword1 = !hidePassword1;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onChanged: (String value) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: confirmpasswordController,
                    validator: ((value) {
                      if (value != passwordController.text) {
                        return "Password doesn't match";
                      } else {
                        return null;
                      }
                    })),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                      minWidth: 55,
                      height: 45,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          debugPrint("Validated");
                        } else {
                          debugPrint("Not Validated");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: const Color.fromARGB(255, 101, 105, 235),
                      textColor: Colors.white,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  MaterialButton(
                    minWidth: 55,
                    height: 45,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
