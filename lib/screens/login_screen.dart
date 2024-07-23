import '../imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var registerUserModel = RegisterUserModel.EmptyUserRegistryModel();

    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ChooseLanguageScreen(userModel: registerUserModel),
              ));

          },
          label: const Text('Sign in with Apple'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}