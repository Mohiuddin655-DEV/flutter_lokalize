import 'package:flutter/material.dart';
import 'package:lokalise_flutter_sdk/lokalise_flutter_sdk.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Lokalise.init(
    projectId: 'FILL YOUR PROJECT ID',
    sdkToken: 'FILL YOUR SDK TOKEN',
  );
  runApp(const App());
}
