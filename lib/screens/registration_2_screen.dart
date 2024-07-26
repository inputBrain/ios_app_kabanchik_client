import 'dart:ui';

import '../imports.dart';

class Registration2Screen extends StatefulWidget {
  final RegisterUserModel userModel;

  const Registration2Screen({Key? key, required this.userModel}) : super(key: key);

  @override
  _Registration2ScreenState createState() => _Registration2ScreenState();
}

class _Registration2ScreenState extends State<Registration2Screen> {
  ClientStatus? selectedOption;
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  void _selectOption(ClientStatus option) {
    setState(() {
      selectedOption = option;
      isNextEnabled = true;
    });
  }

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
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05
                          ),
                          child: Text(
                            'User registration',
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.07,
                              fontFamily: 'JacquesFrancoisShadow',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * 0.8,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildOptionButton('For the client\n(to order services)', ClientStatus.client),
                                  SizedBox(height: constraints.maxHeight * 0.03),
                                  _buildOptionButton('For the masters\n(to start earning)', ClientStatus.master),
                                ],
                              ),
                            ),
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
                                text: 'back', onPressed: () {
                                Navigator.pop(context);
                              },
                              ),
                              ScreenNavigationWidget(
                                text: 'further', isFurtherEnabled: isNextEnabled,  onPressed: isNextEnabled ? () {
                                widget.userModel.clientStatus = selectedOption;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      NextScreen(userModel: widget.userModel)),
                                );
                              } : null,
                              ),
                            ],
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

  Widget _buildOptionButton(String text, ClientStatus option) {
    bool isSelected = selectedOption == option;
    
    return GestureDetector(
      onTap: () => _selectOption(option),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromRGBO(238, 108, 56, 1),
                  width: 10
              ),
              color: isSelected ? const Color.fromRGBO(73, 68, 65, 1) : Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 36,
                  fontFamily: 'Rokkitt',
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final RegisterUserModel userModel;

  const NextScreen({Key? key, required this.userModel}) : super(key: key);

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'FirstName: ',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'Rokkitt'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'App Language: ${userModel.appLanguage}',
                            style: const TextStyle(
                                fontSize: 20, fontFamily: 'Rokkitt'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'ClientType: ${userModel.clientStatus ==
                                ClientStatus.master ? "Master" : "Client"}',
                            style: const TextStyle(
                                fontSize: 20, fontFamily: 'Rokkitt'),
                          ),
                        ],
                      ),
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
                        ScreenNavigationWidget(text: 'back', onPressed: () {
                          Navigator.pop(context);
                        }),
                        ScreenNavigationWidget(text: 'further', onPressed: () {

                        }),
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
}