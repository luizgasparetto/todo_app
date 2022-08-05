import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

IntegrationTestWidgetsFlutterBinding createBinding() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  return binding;
}

void setupBinding() {
  (IntegrationTestWidgetsFlutterBinding.ensureInitialized()).framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
}
