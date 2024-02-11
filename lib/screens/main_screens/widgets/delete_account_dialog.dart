import 'package:flutter/material.dart';
import 'package:sole_seekers/constant/font_styles.dart';
import 'package:sole_seekers/core/providers/services_provider.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/auth_button.dart';
import 'package:sole_seekers/screens/auth_screens/widgets/auth_textfield..dart';

deleteAccountDialog(BuildContext context, ServicesProvider provider) {
  TextEditingController passwordController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text("Are you sure want to delete your account?",
              style: WriteStyles.headerMedium(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          content: AuthTextField(
              obscureText: true,
              hintText: 'Enter Password',
              controller: passwordController),
          actions: [
            AuthButton(
                text: 'Delete Account',
                isLoading: provider.loader,
                onTap: () {
                  provider.deleteUser(context, passwordController.text);
                }),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Close',
                  style: WriteStyles.bodySmall(context)
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ))
          ],
        );
      });
}
