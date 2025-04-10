import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/utils/animated_snackbar.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/core/utils/storage_services.dart';
import 'package:e_commerce/core/widget/loading_item.dart';
import 'package:e_commerce/core/widget/primary_button_widget.dart';
import 'package:e_commerce/core/widget/primary_textfield_widget.dart';
import 'package:e_commerce/features/login/cubit/login_cubit.dart';
import 'package:e_commerce/features/login/cubit/login_state.dart';
import 'package:e_commerce/features/register/widget/top_register_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sl<StorageServices>().readToken().then((token) {
      if (token != null && token.isNotEmpty) {
        context.pushReplacementNamed(AppRouter.homeScreen);
      }
    });
  }

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
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ErrorLoginState) {
            showAnimatedSnackDialog(
              context,
              message: state.message,
              type: AnimatedSnackBarType.error,
            );
          }
          if (state is SuccessLoginState) {
            showAnimatedSnackDialog(
              context,
              message: state.message,
              type: AnimatedSnackBarType.success,
            );
            GoRouter.of(context).pushReplacementNamed(AppRouter.homeScreen);
          }
        },
        builder: (context, state) {
          if (state is LoadingLoginState) {
            return const LoadingWidget();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 19),
                    TopRegisterHeadline(
                      title: "Login to your account",
                      subtitle: "It’s great to see you again.",
                    ),
                    const SizedBox(height: 24),

                    Text("User Name", style: AppStyles.black16W500TextStyle),
                    PrimaryTextfieldWidget(
                      hintText: "Enter your full name",
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    Text("Password", style: AppStyles.black16W500TextStyle),
                    PrimaryTextfieldWidget(
                      controller: passwordController,
                      hintText: "Enter your Password",
                      isPassword: isPassword,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is Empty";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 8 characters";
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 42),

                    PrimaryButtonWidget(
                      width: 325.w,
                      borderRadius: 10.r,
                      buttonText: "Sign In",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            username: nameController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 162),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: AppStyles.gray12MediumTextStyle.copyWith(
                            fontSize: 16.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "Join",
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
          );
        },
      ),
    );
  }
}
