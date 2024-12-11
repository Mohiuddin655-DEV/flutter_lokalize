## STEP-1: INITIALIZATION

```dart
void main() async {
  // ...
  await Lokalise.init(
    projectId: 'FILL YOUR PROJECT ID',
    sdkToken: 'FILL YOUR SDK TOKEN',
    preRelease: true,
  );
}
```

## STEP-2: CONNECT WITH APP
```dart
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// ----------------------------------------------------------------------
      /// LOKALIZE START
      /// ----------------------------------------------------------------------
      localizationsDelegates: Lt.localizationsDelegates,
      supportedLocales: Lt.supportedLocales,
      locale: const Locale("bn"), // OPTIONAL
      title: Lt.of(context).appTitle, // OPTIONAL
      /// ----------------------------------------------------------------------
      /// LOKALIZE END
      /// ----------------------------------------------------------------------
      //... continue
    );
  }
}
```

## STEP-3: CREATE AN intl_LANGUAGE_CODE.arb TRANSLATION FILE.

- Example: 'intl_en.arb'

### TEMPLATE:

```arb
{
  "@@locale": "en",
  "appTitle": "Dr Cal",
  "@appTitle": {
    "description": "Main application title"
  },
  "welcome": "Welcome!",
  "welcome_body": "Let’s begin with a few question to create your Customized Plan",
  "welcome_button": "Get Started",
  "createdBy": "Tutorial by {company}",
  "@createdBy": {
    "description": "Copyright message",
    "placeholders": {
      "company": {
        "type": "String",
        "example": "Demo"
      }
    }
  },
  "currentLocale": "Current locale is {locale}",
  "currentDate": "Today is {date}",
  "@currentDate": {
    "description": "Localized current date",
    "placeholders": {
      "date": {
        "type": "DateTime",
        "format": "yMMMMEEEEd"
      }
    }
  },
  "currencyDemo": "Here's a demo price: {value}",
  "@currencyDemo": {
    "description": "A demo showing how to localize currency",
    "placeholders": {
      "value": {
        "type": "int",
        "format": "currency",
        "optionalParameters": {
          "decimalDigits": 2
        }
      }
    }
  },
  "pressButton": "Press the button below",
  "buttonPressed": "{count, plural, =0{Has not pressed yet} =1{Pressed 1 time} other{Pressed {count} times}}",
  "@buttonPressed": {
    "description": "Shows how many times the button has been pressed (pluralized)",
    "placeholders": {
      "count": {
        "type": "num",
        "format": "compact"
      }
    }
  }
}
```

## STEP-4: RUN CLI CODE USING TERMINAL
```shell
dart run lokalise_flutter_sdk:gen-lok-l10n
```

## STEP-5: FETCH REMOTE TRANSLATIONS. Like:
```dart
import 'package:flutter/material.dart';
import 'package:lokalise_flutter_sdk/lokalise_flutter_sdk.dart';

class LokalizeInitializer extends StatefulWidget {
  final Widget child;

  const LokalizeInitializer({
    super.key,
    required this.child,
  });

  @override
  State<LokalizeInitializer> createState() => _LokalizeInitializerState();
}

class _LokalizeInitializerState extends State<LokalizeInitializer> {
  bool _isLoading = true;

  void _notify(dynamic) {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Lokalise.instance.update().then(_notify, onError: _notify);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return widget.child;
  }
}
```

## STEP-6: APPLY LOKALIZE ON UI
```dart
import 'package:flutter/material.dart';
import 'package:lokalise_flutter_sdk/lokalise_flutter_sdk.dart';

import '../../../../l10n/generated/l10n.dart';
import '../../../models/todo_model.dart';
import '../../custom_widgets/loading.dart';
import 'widgets/add_todo_button.dart';
import 'widgets/todo_section.dart';

class TodoScreen extends StatefulWidget {
  final List<TodoModel> _todos = [];

  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreen();
}

class _TodoScreen extends State<TodoScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Lokalise.instance.update().then(
          (response) => setState(() => _isLoading = false),
      onError: (error) => setState(() => _isLoading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Lt
          .of(context)
          .list_title)),
      floatingActionButton: AddTodoButton(onAddPress: _onAddTodo),
      body: _isLoading
          ? const Loading()
          : SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final completed = widget._todos.where((e) => e.completed).toList();
    final pending = widget._todos.where((e) => !e.completed).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            Lt.of(context).total_todo(widget._todos.length),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: TodoSection(
              title: Lt.of(context).pending_todo(pending.length),
              todos: pending,
              onTodoPress: _onTodoPress,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: TodoSection(
              title: Lt.of(context).completed_todo(completed.length),
              todos: completed,
              onTodoPress: _onTodoPress,
            ),
          ),
        ],
      ),
    );
  }

  void _onAddTodo(TodoModel todo) => setState(() => widget._todos.add(todo));

  void _onTodoPress(TodoModel todo) =>
      setState(() => todo.completed = !todo.completed);
}
```
