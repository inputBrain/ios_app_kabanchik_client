import '../imports.dart';

class NextScreen extends StatelessWidget {
  final RegisterUserModel userModel;

  const NextScreen({super.key, required this.userModel});

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