import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangScreen extends StatelessWidget {
  final Function(Locale) changeLocal;

  const LangScreen({super.key, required this.changeLocal});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.welcomeTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: DropdownWidget(
                  changeLocal: changeLocal,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(AppLocalizations.of(context)!.welcomeTitle),
            Text(AppLocalizations.of(context)!.getStartButtonText),
            Text(AppLocalizations.of(context)!.change),
          ],
        ),
      ),
    );
  }
}

class DropdownWidget extends StatefulWidget {
  final Function(Locale) changeLocal;
  DropdownWidget({required this.changeLocal});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  Locale? _selectedLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Language Demo'),
      // ),
      body: Align(
        alignment: Alignment.center,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<Locale>(
                padding: EdgeInsets.only(left: 8),
                value: _selectedLocale,
                hint: Text('Select Language'),
                onChanged: (Locale? newValue) {
                  setState(() {
                    _selectedLocale = newValue;
                    // Call a function to change app language based on selected locale
                    // For example:
                    widget
                        .changeLocal(newValue!); // Call changeLocal from MyApp
                  });
                },
                items: AppLocalizations.supportedLocales
                    .where((locale) => locale.countryCode != null)
                    .map((Locale locale) {
                  String itemText = '${locale.countryCode!.toUpperCase()} ';
                  String itemText1 = ' ${locale.languageCode.toUpperCase()} ';
                  return DropdownMenuItem<Locale>(
                    value: locale,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(itemText),
                          ],
                        ),
                        // Divider()
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
