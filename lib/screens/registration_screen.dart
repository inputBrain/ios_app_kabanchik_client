import '../imports.dart';

class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var registerUserModel = RegisterUserModel.EmptyUserRegistryModel();


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
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'User registration',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    ClientTypeOption(
                      title: 'For the client\n(to order services)',
                      isSelected: registerUserModel.clientStatus == ClientStatus.client,
                      onTap: () => setState(() {
                        registerUserModel = registerUserModel.copyWith(clientStatus: ClientStatus.client);
                      }),
                    ),
                    const SizedBox(height: 20),
                    ClientTypeOption(
                      title: 'For the masters\n(to start earning)',
                      isSelected: registerUserModel.clientStatus == ClientStatus.master,
                      onTap: () => setState(() {
                        registerUserModel = registerUserModel.copyWith(clientStatus: ClientStatus.master);
                      }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text('back'),
                    ),
                    ElevatedButton(
                      onPressed: registerUserModel.clientStatus != null ? () {

                        print('registerUserModel.appLanguage: ${registerUserModel.appLanguage}');
                        print('registerUserModel.clientStatus: ${registerUserModel.clientStatus}');

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChooseLanguageScreen(userModel: registerUserModel),
                          ),
                        );
                      }
                          : null,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text('further'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientTypeOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ClientTypeOption({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange, width: 2),
            ),
            child: Center(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}