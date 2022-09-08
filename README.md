## Access Environment Variables merging dart command line over platform environment variables.

> Gives access to environment variables with two static methods for EnvVariables class.  
> - One method always returns a String with a default value of '' (empty string)   
> - The other method return null if no value is defined in command line and the platform environment.  
> 
> Read environment variables looking up in the following order:  
> - in dart command line --define (or flutter --dart-define)  
> - in Platform.environment
> - in the given (optional) defaultValue
>
## Examples
```dart
final String value = EnvVariables.fromEnvironment('varName'); // Defaults to ''
final String other = EnvVariables.fromEnvironment('otherName', defaultValue: 'myValue');
final String? valueOrNull = EnvVariables.fromEnvironmentOrNull('varName'); // Defaults to null;
```

## Additional information

This package access command line and platform environment variables.  
You need to set Environment variable to run tests.  

In windows do: 
```shell
$ $Env:var2 = 'Platform Var2'
$ $Env:var3 = 'Platform Var3'
$ dart --define=var1='dartDefined Var1' --define=var2='dartDefined Var2' test
```

In linux do:
```shell
$ var2='Platform Var2' var3='Platform Var3' dart --define=var1='dartDefined Var1' --define=var2='dartDefined Var2' test
```