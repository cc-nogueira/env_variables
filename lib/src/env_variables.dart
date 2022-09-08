import 'dart:io';

class EnvVariables {
  static const _inexistent = '__NULL_VALUE__';

  static String fromEnvironment(String name, {String defaultValue = ''}) {
    return String.fromEnvironment(
      name,
      defaultValue: Platform.environment[name] ?? defaultValue,
    );
  }

  static String? fromEnvironmentOrNull(String name) {
    final value = fromEnvironment(name, defaultValue: _inexistent);
    return identical(value, _inexistent) ? null : value;
  }
}
