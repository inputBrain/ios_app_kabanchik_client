import '../imports.dart';

class Registration3Screen extends StatefulWidget {
  final RegisterUserModel userModel;

  const Registration3Screen({super.key, required this.userModel});

  @override
  _Registration3ScreenState createState() => _Registration3ScreenState();
}

class _Registration3ScreenState extends State<Registration3Screen> {
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('wwwroot/Images/background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(70, 172, 166, 1),
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoColumn(
                          title: "about the project ++",
                        ),
                        InfoColumn(
                          title: "how it works",
                        ),
                        InfoColumn(
                          title: "guarantee and safety",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
class InfoColumn extends StatelessWidget {
  final String title;

  const InfoColumn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rokkitt",
                ),
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}