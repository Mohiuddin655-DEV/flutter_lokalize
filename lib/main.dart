import 'package:flutter/material.dart';
import 'package:lokalise_flutter_sdk/lokalise_flutter_sdk.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Lokalise.init(
    projectId: '69406755673aeba009d1a0.72786162',
    sdkToken: '266eb19742394e8f2da2c4b6d02a4ad44c891688',
  );
  runApp(const App());
}
