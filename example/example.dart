import 'package:env_variables/env_variables.dart';

void main() {
  final String? valueOrNull = EnvVariables.fromEnvironmentOrNull('varName'); //
  final String value =
      EnvVariables.fromEnvironment('varName', defaultValue: 'myValue');

  printUsage();

  print('You got the following values:');
  print('  EnvVariables.fromEnviromentOrNull(\'varName\') = $valueOrNull');
  print(
      "  EnvVariables.fromEnviroment('varName', defaultValue: 'myValue') => '$value'");
}

void printUsage() {
  print('Environment variables are defined '
      'either in command line or through the platform environment.\n');

  print('You may test this example running with different contexts such as:');
  print('\$ dart example.dart\n');
  print('\$ dart --define=varName="a value" example.dart\n');

  print('In Windows:');
  print('\$ \$Env:varName = "env value"');
  print('\$ dart example.dart\n');

  print('Or in Linux:');
  print('\$ varName="linuxEnv value" dart example.dart\n\n');
}
