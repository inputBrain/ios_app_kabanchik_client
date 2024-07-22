import '../imports.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  List<Map<String, dynamic>> countries = [];
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    final String response = await rootBundle.loadString('wwwroot/countries.json');
    final data = await json.decode(response);
    setState(() {
      countries = List<Map<String, dynamic>>.from(data);
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
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Choose language',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: countries.length + (countries.length > 25 ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < 25) {
                      return _buildFlagItem(countries[index]);
                    } else if (index == 25 && countries.length > 25) {
                      return _buildMoreButton();
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlagItem(Map<String, dynamic> country) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = country['language'];
        });
        // Here you can navigate to the next screen or handle the selection
        print('Selected language: ${country['language']}');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedLanguage == country['language'] ? Colors.cyan : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(
          country['flagPath'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMoreButton() {
    return ElevatedButton(
      onPressed: () {
        _showAllFlags();
      },
      child: Text('...'),
    );
  }

  void _showAllFlags() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('All Languages'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: Image.asset(country['flagPath'], width: 32, height: 32),
                  title: Text(country['language']),
                  onTap: () {
                    setState(() {
                      selectedLanguage = country['language'];
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}