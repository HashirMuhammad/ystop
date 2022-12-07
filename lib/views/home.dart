import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/providers/example_autodispose_provider.dart';
import 'package:ystop_mystop/core/providers/example_changenotifier_provider.dart';
import 'package:ystop_mystop/core/providers/example_provider.dart';
import 'package:ystop_mystop/core/utils/app_utils.dart';
import 'package:ystop_mystop/views/login.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Welcome!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // Read a value or call a function using a provider like below:
              ref.read(exampleProvider).exampleVariableHome,
              style: AppStyles.exampleTextstyle2,
            ),
            const SizedBox(height: 30),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                // Register a listener that watches the counterValue variable,
                // when its value changes, then the returned widget in this builder scope is rebuilt
                // with the new value for the counterValue variable
                int counterValue = ref.watch(exampleChangeNotifierProvider).counterValue;
                int counterValue2 = ref.watch(exampleAutoDisposeProvider).counterValue;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Counter value (click button in bottom right):\n$counterValue',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'AutoDisposed counter value (click button in bottom right):\n$counterValue2',
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                // Navigate to the login screen
                Navigator.of(context).pushAndRemoveUntil<void>(
                  MaterialPageRoute<void>(builder: (BuildContext context) => const LoginView()),
                  ModalRoute.withName('/login'),
                );

                // Show message to user
                AppUtils.showSnackbar(this, 'Logged out!');
              },
              child: Text(
                'Logout (click me)',
                style: AppStyles.exampleTextstyle,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tell the change notifier provider to increment the counter value
          ref.read(exampleChangeNotifierProvider).incrementCounter();
          ref.read(exampleAutoDisposeProvider).incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
