import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_icons.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/config/app_strings.dart';
import 'package:flutter_full_course/provider/app_repo.dart';

import 'package:flutter_full_course/provider/login_provider.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                Text(
                  AppStrings.helloWelcome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                TextField(
                  onChanged: (value) {
                    context.read<LoginProvider>().username = value;
                  },
                  decoration: InputDecoration(
                    hintText: AppStrings.username,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  onChanged: (value) {
                    context.read<LoginProvider>().password = value;
                  },
                  decoration: InputDecoration(
                    hintText: AppStrings.password,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print('Forgot is clicked');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: Text(AppStrings.forgotPassword),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginProvider>().login().then((value) {
                        context.read<AppRepo>().user = value.user;
                        context.read<AppRepo>().token = value.token;
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.main);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: Text(AppStrings.login),
                  ),
                ),
                Spacer(),
                Text(
                  AppStrings.orSignInWith,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Google is clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.icGoogle,
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(AppStrings.loginWithGoogle),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.icFacebook,
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(AppStrings.loginWithFacebook),
                        ],
                      )),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                        ),
                        child: Text(
                          AppStrings.signup,
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
