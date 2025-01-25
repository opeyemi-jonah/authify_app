import 'package:authify_app/pages/login_page.dart';
import 'package:authify_app/utils/animations/login_page_animations.dart';
import 'package:authify_app/utils/page_routes/slide_page_route.dart';
import 'package:flutter/material.dart';

class AnimatedHomePage extends StatefulWidget {
  const AnimatedHomePage({super.key});

  @override
  State<AnimatedHomePage> createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HomePage(_controller);
  }
}

class _HomePage extends StatelessWidget {
  double deviceHeight = 0.00;
  double deviceWidth = 0.00;

  Color primaryColor = const Color.fromRGBO(169, 224, 241, 1.0);
  final AnimationController _controller;
  late EnterAnimation _animation;

  _HomePage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
              _nameWidget(),
              SizedBox(
                height: deviceHeight * 0.10,
              ),
              _logoutButton(context),
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
      builder: (contecxt,child) =>  Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(_animation.circleSize.value, _animation.circleSize.value, 1),
        child: Container(
          height: circleD,
          width: circleD,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(500),
            image: const DecorationImage(
              image: AssetImage('assets/images/main_avatar.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return MaterialButton(
      minWidth: deviceWidth * 0.38,
      height: deviceHeight * 0.05,
      color: Colors.white,
      onPressed: () {
        Navigator.push(context, SlidePageRoute(const AnimatedLoginPage()));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: primaryColor, width: 3),
      ),
      child: Text(
        "LOG OUT",
        style: TextStyle(
            fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _nameWidget() {
    return Container(
      child: Text(
        "John Doe",
        style: TextStyle(
            color: primaryColor, fontSize: 35, fontWeight: FontWeight.w400),
      ),
    );
  }
}
