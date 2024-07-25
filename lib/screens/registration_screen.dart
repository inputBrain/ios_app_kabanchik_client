import '../imports.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
    var registerUserModel = RegisterUserModel.emptyUserRegistryModel();

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
                          padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'User registration',
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.07,
                                fontFamily: 'JacquesFrancoisShadow',
                              ),
                            ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60, top: 50, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildOptionButton(
                                  'For the client\n(to order services)',
                                  ClientStatus.client,
                                ),
                                const SizedBox(height: 20),
                                _buildOptionButton(
                                  'For the masters\n(to start earning)',
                                  ClientStatus.master,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNavigationButton('back', () {
                              Navigator.pop(context);
                            }),
                            _buildNavigationButton('further', isNextEnabled ? () {
                              registerUserModel.clientStatus = selectedOption;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NextScreen()),
                              );
                            } : null),
                          ],
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
              style: TextStyle(fontSize: 16),
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Next Screen'),
      ),
    );
  }
}