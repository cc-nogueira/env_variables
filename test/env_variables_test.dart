import 'package:env_variables/env_variables.dart';
import 'package:test/test.dart';

/// Test should be run with:
/// $ $Env:var2 = 'Platform Var2'
/// $ $Env:var3 = 'Platform Var3'
/// $ dart --define=var1='dartDefined Var1' --define=var2='dartDefined Var2' test
void main() {
  final defautlValue = 'default value';
  final dartDefinedVar1 = 'dartDefined Var1';
  final dartDefinedVar2 = 'dartDefined Var2';
  final platformVar3 = 'Platform Var3';

  group('Test default value or null when variable is unknown', () {
    test(
        'Should return an empty string '
        'when the enviroment no variable is found nor a default is given', () {
      expect(EnvVariables.fromEnvironment('unknown-variable'), '');
    });

    test(
        'fromEnvironmentOrNull should return null '
        'when the enviroment variable is not found', () {
      expect(EnvVariables.fromEnvironmentOrNull('unknown-variable'), isNull);
    });

    test(
        'Should return the given default when '
        'the enviroment variable is not found', () {
      expect(EnvVariables.fromEnvironment('var0', defaultValue: defautlValue),
          defautlValue);
    });
  });

  group('Test when with dart --define', () {
    test(
        'Should return the --define value '
        'when dart command line is provided, with or without default.', () {
      expect(EnvVariables.fromEnvironment('var1'), dartDefinedVar1);
      expect(EnvVariables.fromEnvironment('var1', defaultValue: 'otherValue'),
          dartDefinedVar1);
    });

    test(
        'fromEnvironmentOrNull should return the --define value '
        'when dart command line is provided, with or without default.', () {
      expect(EnvVariables.fromEnvironmentOrNull('var1'), dartDefinedVar1);
    });
  });

  group('Test when with dart --define and platform environment', () {
    test(
        'Should return the --define value '
        'when dart command line is provided over the same platform variable, '
        'with or without default.', () {
      expect(EnvVariables.fromEnvironment('var2'), dartDefinedVar2);
      expect(EnvVariables.fromEnvironment('var2', defaultValue: 'otherValue'),
          dartDefinedVar2);
    });

    test(
        'fromEnvironmentOrNull should return the --define value '
        'when dart command line is provided over the same platform variable, '
        'with or without default.', () {
      expect(EnvVariables.fromEnvironmentOrNull('var2'), dartDefinedVar2);
    });
  });

  group('Test when with only platform environment', () {
    test(
        'Should return the platform variable '
        'when not defined in dart command line, with or without default.', () {
      expect(EnvVariables.fromEnvironment('var3'), platformVar3);
      expect(EnvVariables.fromEnvironment('var3', defaultValue: 'otherValue'),
          platformVar3);
    });

    test(
        'Should return the platform variable '
        'when not defined in dart command line, with or without default.', () {
      expect(EnvVariables.fromEnvironmentOrNull('var3'), platformVar3);
    });
  });
}
