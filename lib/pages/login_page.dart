import 'package:authify_app/utils/animations/login_page_animations.dart';
import 'package:flutter/material.dart';

class AnimatedLoginPage extends StatefulWidget {
  const AnimatedLoginPage({super.key});

  @override
  State<AnimatedLoginPage> createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _LoginPage(controller);
  }
}

class _LoginPage extends StatelessWidget {
  late double deviceHeight;
  late double deviceWidth;
  Color primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  Color secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  late AnimationController controller;
  late EnterAnimation _animation;

  _LoginPage(controller) {
    controller = controller;
    _animation = EnterAnimation(controller);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: deviceHeight * 0.60,
          width: deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _avatarWidget(),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              _emailTextField(),
              _passwordTextField(),
              SizedBox(
                height: deviceHeight * 0.10,
              ),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double circleD = deviceHeight * 0.25;

    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(_animation.circleSize.value, _animation.circleSize.value, 1),
          child: Container(
            height: circleD,
            width: circleD,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(500),
              image: const DecorationImage(
                image: AssetImage('assets/images/main_avatar.png'),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _emailTextField() {
    return SizedBox(
      width: deviceWidth * 0.70,
      child: const TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Type email here ...",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return SizedBox(
      width: deviceWidth * 0.70,
      child: const TextField(
        obscureText: true,
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Type password here ...",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      minWidth: deviceWidth * 0.38,
      height: deviceHeight * 0.05,
      color: Colors.white,
      onPressed: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: const BorderSide(color: Colors.white)),
      child: Text(
        "LOG IN",
        style: TextStyle(
            fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
