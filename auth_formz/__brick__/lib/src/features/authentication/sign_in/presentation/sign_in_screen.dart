import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:zot_ecommerce/src/common_widgets/button.dart';
import 'package:zot_ecommerce/src/common_widgets/input_field.dart';

import 'sign_in_controller.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signInNotifierProvider).email;
    final password = ref.watch(signInNotifierProvider).password;

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.network(
              'https://cdni.iconscout.com/illustration/premium/thumb/account-login-6003624-4976687.png',
              height: MediaQuery.of(context).size.height / 4,
            ),
            const Text(
              '{{ appName }}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InputField(
              label: 'Username',
              hintText: 'Enter username',
              onChanged: (value) =>
                  ref.read(signInNotifierProvider.notifier).updateEmail(value),
              inputType: TextInputType.name,
              validator: (value) => email.error?.getMessage(),
            ),
            InputField(
              label: 'Password',
              hintText: 'Enter password',
              onChanged: (value) => ref
                  .read(signInNotifierProvider.notifier)
                  .updatePassword(value),
              inputType: TextInputType.visiblePassword,
              validator: (value) => password.error?.getMessage(),
            ),
            CustomButton(
              'Submit',
              enabled:
                  ref.watch(signInNotifierProvider).status == FormzStatus.valid,
              onPressed: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
