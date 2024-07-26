import '../imports.dart';

class RegistrationScreen extends StatefulWidget {
  final RegisterUserModel userModel;

  const RegistrationScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
    // var registerUserModel = RegisterUserModel.emptyUserRegistryModel();

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
                          padding: EdgeInsets.only(top: constraints.maxHeight * 0.05),
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
                                  _buildOptionButton(
                                    'For the client\n(to order services)',
                                    ClientStatus.client,
                                  ),
                                  SizedBox(height: constraints.maxHeight * 0.03),
                                  _buildOptionButton(
                                    'For the masters\n(to start earning)',
                                    ClientStatus.master,
                                  ),
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
                              _buildNavigationButton('back', () {
                                Navigator.pop(context);
                              }),
                              _buildNavigationButton('further', isNextEnabled ? () {
                                widget.userModel.clientStatus = selectedOption;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NextScreen(userModel: widget.userModel)),
                                );
                              } : null),
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange, width: 0.5),
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 30, fontFamily: 'Rokkitt'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(String text, VoidCallback? onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 73.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(116, 192, 188, 1),
          borderRadius: BorderRadius.zero,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Rokkitt'
            ),
          ),
        ),
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
                        _buildNavigationButton('back', () {
                          Navigator.pop(context);
                        }),
                        _buildNavigationButton('further', () {
                          // Add navigation logic for the 'further' button
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
  Widget _buildNavigationButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 73.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(116, 192, 188, 1),
          borderRadius: BorderRadius.zero,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Rokkitt'
            ),
          ),
        ),
      ),
    );
  }
}