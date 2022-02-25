import 'package:flutter/material.dart';
import 'package:flutter_desgin_list/displaylist.dart';
void main() {
  runApp(LoginSignupUI());
}

class LoginSignupUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Signup UI",
      // home: ViewCustomerScreen(),
      home:DisplayList(),
      // home:HomeScreen(),
      // check internet
      // home:MyHomePageFuritList() ,
      // home:OrderProduct() ,
    );
  }
}

