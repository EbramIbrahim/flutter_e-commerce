import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widget/primary_button_widget.dart';
import 'package:e_commerce/core/widget/primary_textfield_widget.dart';
import 'package:e_commerce/features/register/widget/top_register_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: false,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19),
                TopRegisterHeadline(
                  title: "Create an account",
                  subtitle: "Let’s create your account.",
                ),
                const SizedBox(height: 24),

                Text("Full Name", style: AppStyles.black16W500TextStyle),
                PrimaryTextfieldWidget(
                  hintText: "Enter your full name",
                  controller: nameController,
                ),
                const SizedBox(height: 16),

                Text("Email", style: AppStyles.black16W500TextStyle),
                PrimaryTextfieldWidget(
                  hintText: "Enter your email address",
                  controller: emailController,
                ),
                const SizedBox(height: 16),

                Text("Password", style: AppStyles.black16W500TextStyle),
                PrimaryTextfieldWidget(
                  controller: passwordController,
                  hintText: "Enter your Password",
                  isPassword: isPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password_hint";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Text("Confirm Password", style: AppStyles.black16W500TextStyle),
                PrimaryTextfieldWidget(
                  hintText: "Enter your Password",
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value! != passwordController.text) {
                      return "confirmed Password dosn't match your password";
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                const SizedBox(height: 42),

                PrimaryButtonWidget(
                  width: 325.w,
                  borderRadius: 10.r,
                  buttonText: "Create Account",
                  onPress: () {},
                ),

                const SizedBox(height: 162),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: AppStyles.gray12MediumTextStyle.copyWith(
                        fontSize: 16.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: AppStyles.black16W500TextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
