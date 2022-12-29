import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<JobListProvider> jobListProvider =
    ChangeNotifierProvider((ChangeNotifierProviderRef<JobListProvider> ref) {
  return JobListProvider(ref);
});

class JobListProvider extends ChangeNotifier {
  JobListProvider(this._ref);
  final Ref _ref;
  int _counterValue = 0;

  int get counterValue => _counterValue;

  TextEditingController currentSearchController = TextEditingController();
  TextEditingController completedSearchController = TextEditingController();
  TextEditingController selectedSearchController = TextEditingController();
  void examplePublicFunction() {
    // Do something like call an API
    // E.g:
    // _currentProject = await _ref.read(projectsApiProvider).getProjectById(1);

    // And then update any Widgets listening to this provider
    // E.g:
    // notifiyListeners();
  }

  void incrementCounter() {
    _counterValue += 1;
    notifyListeners();
  }
}
