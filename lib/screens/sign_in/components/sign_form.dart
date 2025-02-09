// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../../components/custom_surfix_icon.dart';
// import '../../../components/form_error.dart';
// import '../../../constants.dart';
// import '../../../helper/keyboard.dart';
// import '../../forgot_password/forgot_password_screen.dart';
// import '../../login_success/login_success_screen.dart';

// class SignForm extends StatefulWidget {
//   const SignForm({super.key});

//   @override
//   _SignFormState createState() => _SignFormState();
// }

// class _SignFormState extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? email;
//   String? password;
//   bool? remember = false;
//   final List<String?> errors = [];

  

//   void addError({String? error}) {
//     if (!errors.contains(error)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error);
//       });
//     }
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (newValue) => email = newValue,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeError(error: kEmailNullError);
//               } else if (emailValidatorRegExp.hasMatch(value)) {
//                 removeError(error: kInvalidEmailError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addError(error: kEmailNullError);
//                 return "";
//               } else if (!emailValidatorRegExp.hasMatch(value)) {
//                 addError(error: kInvalidEmailError);
//                 return "";
//               }
//               return null;
//             },
//             decoration: const InputDecoration(
//               labelText: "Email",
//               hintText: "Enter your email",
//               labelStyle: TextStyle(
//                 color: Color(0xFF7C9399),
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//               ),
//               hintStyle: TextStyle(
//                 color: Color(0xFF7C9399),
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//               ),
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             obscureText: true,
//             onSaved: (newValue) => password = newValue,
//             onChanged: (value) {
//               if (value.isNotEmpty) {
//                 removeError(error: kPassNullError);
//               } else if (value.length >= 8) {
//                 removeError(error: kShortPassError);
//               }
//               return;
//             },
//             validator: (value) {
//               if (value!.isEmpty) {
//                 addError(error: kPassNullError);
//                 return "";
//               } else if (value.length < 8) {
//                 addError(error: kShortPassError);
//                 return "";
//               }
//               return null;
//             },
//             decoration: const InputDecoration(
//               labelText: "Password",
//               hintText: "Enter your password",
//               labelStyle: TextStyle(
//                 color: Color(0xFF7C9399),
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//               ),
//               hintStyle: TextStyle(
//                 color: Color(0xFF7C9399),
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//               ),
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Checkbox(
//                 value: remember,
//                 activeColor: Color(0xFF60C6A2),
//                 onChanged: (value) {
//                   setState(() {
//                     remember = value;
//                   });
//                 },
//               ),
//               const Text(
//                 "Remember Me",
//                 style: TextStyle(
//                   color: Color(0x9918181B),
//                   fontSize: 12,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(
//                     context, ForgotPasswordScreen.routeName),
//                 child: const Text(
//                   "Forgot Password?",
//                   style: TextStyle(
//                     color: Color(0x9918181B),
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           FormError(errors: errors),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState!.save();
//                 // if all are valid then go to success screen
//                 KeyboardUtil.hideKeyboard(context);
//                 Navigator.pushNamed(context, LoginSuccessScreen.routeName);
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF60C6A2),
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               minimumSize: Size(100, 50),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//             child: const Text(
//               "Continue",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _auth.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        // If sign in is successful, navigate to success screen
        KeyboardUtil.hideKeyboard(context);
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } on FirebaseAuthException catch (e) {
        // Handle error
        if (e.code == 'user-not-found') {
          addError(error: "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          addError(error: "Wrong password provided.");
        } else {
          addError(error: e.message);
        }
      } catch (e) {
        addError(error: "An unknown error occurred.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              labelStyle: TextStyle(
                color: Color(0xFF7C9399),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              hintStyle: TextStyle(
                color: Color(0xFF7C9399),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              labelStyle: TextStyle(
                color: Color(0xFF7C9399),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              hintStyle: TextStyle(
                color: Color(0xFF7C9399),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Color(0xFF60C6A2),
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text(
                "Remember Me",
                style: TextStyle(
                  color: Color(0x9918181B),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0x9918181B),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _signIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF60C6A2),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              minimumSize: Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
