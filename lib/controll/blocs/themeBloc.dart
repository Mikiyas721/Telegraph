import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:rxdart/subjects.dart';

class ThemeBloc extends Disposable {
  final selectedThemeStream = BehaviorSubject();

  Stream<String> get selectedTheme =>
      selectedThemeStream.map((selectedValue) => selectedValue);

  Function(String selectedValue) get setSelectedTheme =>
      selectedThemeStream.add;

  @override
  void dispose() {
    selectedThemeStream.close();
  }
}
