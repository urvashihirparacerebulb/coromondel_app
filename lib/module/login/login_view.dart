import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/common_widget.dart';
import '../dashboard/dashboard_view.dart';
import '../utility/color_utility.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginScreenForm = GlobalKey<FormState>();
  final TextEditingController _employeeId = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: commonStructure(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_bg.png'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: const [
                    Text(
                      'Welcome to Coromandel',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign in to Your Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: lightFontColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Form(
                          key: _loginScreenForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Employee Id',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: titleColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: _employeeId,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Employee Id',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: titleColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: _password,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '* * * * * *',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.1, 1.0],
                                      colors: [
                                        firstColor,
                                        secondaryColor
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const DashboardView());
                                  },
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide.none),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(vertical: 22),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: whiteColor
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
