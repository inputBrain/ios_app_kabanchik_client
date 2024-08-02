import '../imports.dart';

class Registration3Screen extends StatefulWidget {
  final RegisterUserModel userModel;

  const Registration3Screen({super.key, required this.userModel});

  @override
  _Registration3ScreenState createState() => _Registration3ScreenState();
}

class _Registration3ScreenState extends State<Registration3Screen> {
  bool isAcceptedTerms = false;
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  void _selectOption() {
    setState(() {
      isAcceptedTerms = !isAcceptedTerms;
      isNextEnabled = isAcceptedTerms;
    });
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
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
                                title: "about the project++",
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Center(child: _buildCircleOption(isAcceptedTerms)),
                        const SizedBox(height: 15),

                        const Text(
                          'accept the user agreement:\nI have read everything and agree to these terms and conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Rokkitt',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 80),
                    ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05,
                      vertical: constraints.maxHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ScreenNavigationWidget(
                          text: 'back',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ScreenNavigationWidget(
                          text: 'further',
                          isFurtherEnabled: isNextEnabled,
                          onPressed: isNextEnabled ? () {
                            widget.userModel.isAcceptedTerms = isAcceptedTerms;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Registration3Screen(userModel: widget.userModel)),
                            );
                          } : null,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCircleOption(bool option) {
    bool isSelected = isAcceptedTerms;

    return GestureDetector(
      onTap: _selectOption,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromRGBO(238, 108, 56, 1),
                width: 7,
              ),
              color: isSelected ? const Color.fromRGBO(73, 68, 65, 1) : Colors.white,
            ),
          ),
        ],
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