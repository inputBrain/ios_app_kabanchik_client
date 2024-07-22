import '../imports.dart';

class SelectClientTypeScreen extends StatelessWidget {
  const SelectClientTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const SafeArea(
          child: Column(
            children: [
                Padding(padding: EdgeInsets.only( top: 20),
                child: Text('User Registration',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ))
            ],
          ),
        ),
      ),
    );
  }
}
