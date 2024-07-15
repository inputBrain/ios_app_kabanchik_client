import '../imports.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
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