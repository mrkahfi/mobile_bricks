import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zog_ui/zog_ui.dart' show ZeroText;
import 'package:{{ packageName }}/gen/assets.gen.dart';
import 'package:{{ packageName }}/src/app/config/config.dart';

import 'package:{{ packageName }}/src/components/button.dart';
import 'package:{{ packageName }}/src/components/textfield.dart';
import 'package:{{ packageName }}/src/presentation/app_controller.dart';
import 'package:{{ packageName }}/src/localization/locale_keys.g.dart';
import 'package:{{ packageName }}/src/utils/extensions/widget_extension.dart';

import 'sign_in_controller.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signInNotifierProvider).email;
    final password = ref.watch(signInNotifierProvider).password;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.dark_mode,
            ),
            onPressed: () =>
                ref.read(appControllerProvider.notifier).toggleThemeMode()),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.authentication
                  .svg(height: MediaQuery.of(context).size.height / 3),
              Text(
                AppConfig.appName.value,
              ),
              CommonTextfield(
                label: LocaleKeys.email.tr(),
                hintText: tr(LocaleKeys.hintEmail),
                onChanged: (value) => ref
                    .read(signInNotifierProvider.notifier)
                    .updateEmail(value),
                inputType: TextInputType.name,
                validator: (value) => email.error?.getMessage(),
              ),
              CommonTextfield(
                label: LocaleKeys.password.tr(),
                hintText: tr(LocaleKeys.hintPassword),
                onChanged: (value) => ref
                    .read(signInNotifierProvider.notifier)
                    .updatePassword(value),
                inputType: TextInputType.visiblePassword,
                validator: (value) => password.error?.getMessage(),
              ),
              CommonButton(
                LocaleKeys.login,
                isLoading: ref.watch(signInNotifierProvider).value.isLoading,
                isDisabled: ref.watch(signInNotifierProvider).status !=
                    FormzStatus.valid,
                onPressed: () {
                  ref.read(signInNotifierProvider.notifier).submit(
                      ref.watch(signInNotifierProvider).email.value,
                      ref.watch(signInNotifierProvider).password.value);
                },
              ),
            ]).withDefaultPadding);
  }
}
