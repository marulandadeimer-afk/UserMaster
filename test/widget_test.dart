import 'presentation/presentation_flow_test.dart' as presentation_tests;
import 'domain/user_entity_test.dart' as domain_tests;
import 'data/user_model_test.dart' as data_tests;
import 'utils/validators_test.dart' as utils_tests;

void main() {
  domain_tests.main();
  data_tests.main();
  utils_tests.main();
  presentation_tests.main();
}
