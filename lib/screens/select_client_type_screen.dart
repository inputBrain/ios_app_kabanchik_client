import '../imports.dart';

class SelectClientTypeScreen extends StatefulWidget {
  const SelectClientTypeScreen({Key? key}) : super(key: key);

  @override
  _SelectClientTypeScreenState createState() => _SelectClientTypeScreenState();
}

class _SelectClientTypeScreenState extends State<SelectClientTypeScreen> {
  bool? isUserClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('wwwroot/Images/background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'User Registration',
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 4,
                          child: Center(
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}