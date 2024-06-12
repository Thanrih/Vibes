import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sakugaacaptors/assets/my_button.dart';
import 'package:sakugaacaptors/assets/my_textfield.dart';
import '../main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  //text controllers
  final emailControler = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    void userSignIn(){
      supabase.auth.signUp(password: passwordController.text, email: emailControler.text).then((value){});
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        foregroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
                  child: const Text('Registre-se', style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                  ),
                  )),
              const SizedBox(height: 25),
              //nome
              MyTextField(controller: emailControler,obscureText: false,hintText: 'E-mail',),//username
              const SizedBox(height: 25),
              //senha
              MyTextField(controller: passwordController,obscureText: true,hintText: 'password',),//password
              const SizedBox(height: 10),
              //esqueceu a senha?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MyButton(
                  onTap: userSignIn, buttonText: 'Login', width: 150, height: 70,colorAway: Colors.white, colorPressed: Colors.black,borderColorAway: Colors.black, borderColorPressed: Colors.white),
              const SizedBox(height: 10),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color:  Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),
              //google e apple

            ],
          ),
        ),
      ),
    );
  }
}