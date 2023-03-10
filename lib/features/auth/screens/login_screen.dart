import 'package:circles/core/common/loader.dart';
import 'package:circles/core/common/sign_in_button.dart';
import 'package:circles/core/constants/constant.dart';
import 'package:circles/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar:AppBar(
        title: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
           border: Border.all(width: 0.5),
           borderRadius: BorderRadius.circular(20), 
           color: Colors.white,
          ),
          child: Image.asset(Constants.logoPath),
        ),
        actions:[
            TextButton(onPressed: () {},
             child: const Text('Skip', style: TextStyle(
              fontWeight: FontWeight.bold,
             ),),
             ),
          ],
      ),
      body: isLoading 
      ? const Loader()
      : Column(
        children: [
          const SizedBox(height: 30,),
          const Text('Create your circle or join One', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),),
          const SizedBox(height: 30,),
           Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
           border: Border.all(width: 0.5),
           borderRadius: BorderRadius.circular(30), 
           color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Constants.loginEmotePath,
            height: 400,
            ),
          ),
        ),
         const SizedBox(height: 20,),
         const SignInButton(),
        ],
      ),
    );
  }
}