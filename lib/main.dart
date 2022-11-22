import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLogin Page',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children:  [
          const Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 15)),
          SizedBox(
            child: Image.asset('assets/images/welcome.jpg',
              height: deviceHeight*0.22,
              width: deviceWidth*0.22,
              alignment: Alignment.bottomCenter,),
          ),
          const Center(child: Text('REGISTRATION PAGE',textAlign: TextAlign.center, style: TextStyle(color: MyColors.darkBlue,fontSize: 23, fontWeight: FontWeight.bold),)),
          const AllTextFields(),
          Container(
            margin: const EdgeInsets.fromLTRB(35,0,35,0),
            height: 45,
          child: ElevatedButton(onPressed: (){},style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                  )
              )
          ),
            child: const Text('REGISTER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),),),),
          TextButton(onPressed: (){}, child: const Text("Already have an account? Sign in", style: TextStyle(fontSize: 12,color: MyColors.darkBlue),)),
        ],
      ),
    );
  }
}
// this class is a combination of all TextField elements
class AllTextFields extends StatefulWidget {
  const AllTextFields({Key? key}) : super(key: key);

  @override
  State<AllTextFields> createState() => _AllTextFieldsState();
}

class _AllTextFieldsState extends State<AllTextFields> {
  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),// defining Left, Right, Top Bottom padding
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,// align it to the end of the screen
            children: [
              // FIRST NAME INPUT
              firstNameField(),
              const Padding(padding: EdgeInsets.only(bottom:14),),
              //LAST NAME IMPUT
              lastNameField(),
              const Padding(padding: EdgeInsets.only(bottom:20),),
              // EMAIL INPUT
              emailField(),
              const Padding(padding: EdgeInsets.only(bottom:20),),
              // PASSWORD INPUT
              passwordField(),
              const Padding(padding: EdgeInsets.only(bottom:20),),
              //Password CONFIRMATION
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: passwordObscured,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    hintText: "Confirm your password",
                    hintStyle: const TextStyle(color: Color(0xFF6DA1BE),fontSize: 14,),
                    labelText: "Password confirmation",
                    labelStyle: const TextStyle(color: MyColors.darkBlue,fontSize: 14,fontWeight: FontWeight.bold),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true ,
                    fillColor: MyColors.softBlue,
                    prefixIcon: const Icon(Icons.key_outlined,
                      color: Color(0xFF6DA1BE),),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        passwordObscured = !passwordObscured;
                      });
                    },
                      icon: Icon(
                        passwordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF5B67D3))
                    )
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom:10),),


            ]
        )
    );
  }
}


Widget firstNameField(){
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        hintText: "Enter your first name",
        hintStyle: const TextStyle(color: MyColors.cyan,fontSize: 14,),
        labelText: "First name",
        labelStyle: const TextStyle(color: MyColors.darkBlue,fontSize: 14,fontWeight: FontWeight.w400),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true ,
        fillColor: MyColors.softBlue,
        prefixIcon: const Icon(Icons.account_box,
          color: Color(0xFF6DA1BE),),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF5B67D3))
        )
    ),
  );
}
Widget lastNameField(){
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        hintText: "Enter your last name",
        hintStyle: const TextStyle(color: Color(0xFF6DA1BE),fontSize: 14,),
        labelText: "Last name",
        labelStyle: const TextStyle(color: MyColors.darkBlue,fontSize: 14,fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true ,
        fillColor: MyColors.softBlue,
        prefixIcon: const Icon(Icons.account_box,
          color: Color(0xFF6DA1BE),),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF5B67D3))
        )
    ),
  );
}
Widget emailField(){
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        hintText: "Enter your email adress",
        hintStyle: const TextStyle(color: Color(0xFF6DA1BE),fontSize: 14,),
        labelText: "E-mail",
        labelStyle: const TextStyle(color: MyColors.darkBlue,fontSize: 14,fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true ,
        fillColor: MyColors.softBlue,
        prefixIcon: const Icon(Icons.mail,
          color: Color(0xFF6DA1BE),),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF5B67D3))
        )
    ),
  );
}
Widget passwordField(){
  return TextFormField(
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
    obscuringCharacter: '*',
    decoration: InputDecoration(
        hintText: "Enter your password",
        hintStyle: const TextStyle(color: Color(0xFF6DA1BE),fontSize: 14,),
        labelText: "Password",
        labelStyle: const TextStyle(color: MyColors.darkBlue,fontSize: 14,fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true ,
        fillColor: MyColors.softBlue,
        prefixIcon: const Icon(Icons.key_outlined,
          color: Color(0xFF6DA1BE),),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFF5B67D3))
        )
    ),
  );
}
class MyColors {
  static const softBlue = Color(0xFFECF8FF);
  static const lightGrey = Color(0xFFD7E0E3);
  static const darkBlue = Color(0xFF444FAB);
  static const blue = Color(0xFF5E6BD8);
  static const lightBlue = Color(0xFF9BA1D2);
  static const cyan = Color(0xFF6DA1BE);
  static const darkCyan = Color(0xFF166486);

}

class ButtonLogin extends StatefulWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
