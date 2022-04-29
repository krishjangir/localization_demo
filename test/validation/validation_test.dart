import 'package:flutter_test/flutter_test.dart';
import 'package:localization_demo/app/utils/validator.dart';

void main() {
  test('Empty user name Test', () {
    var result = Validator.validateUserName('');
    expect(result, 'Please enter user name!');
  });

  test('Invalid user name Test', () {
    var result = Validator.validateUserName('ss');
    expect(result, 'Please enter valid user name!');
  });

  test('Valid user name Test', () {
    var result = Validator.validateUserName('krishan');
    expect(result, null);
  });

  test('Empty Password Test', () {
    var result = Validator.validatePassword('');
    expect(result, 'Please enter password!');
  });

  test('Invalid Password Test', () {
    var result = Validator.validatePassword('12');
    expect(result, 'Password must be more than 3 character');
  });

  test('Valid Password Test', () {
    var result = Validator.validatePassword('krishan12345');
    expect(result, null);
  });

  test('Invalid Login Form Null field Test', () {
    var result = Validator.validateLoginForm(null, null);
    expect(result, false);
  });

  test('Invalid Login Form  blank Null field Test', () {
    var result = Validator.validateLoginForm('', null);
    expect(result, false);
  });

  test('Invalid Login Form Null  blank  field Test', () {
    var result = Validator.validateLoginForm(null, '');
    expect(result, false);
  });

  test('Invalid Login Form blank field Test', () {
    var result = Validator.validateLoginForm('', '');
    expect(result, false);
  });

  test('Invalid Login Form invalid field Test', () {
    var result = Validator.validateLoginForm('12', '');
    expect(result, false);
  });

  test('Invalid Login Form invalid field Test', () {
    var result = Validator.validateLoginForm('', '12');
    expect(result, false);
  });

  test('Invalid Login Form invalid field Test', () {
    var result = Validator.validateLoginForm('12', '121');
    expect(result, false);
  });

  test('Invalid Login Form invalid field Test', () {
    var result = Validator.validateLoginForm('121', '11');
    expect(result, false);
  });

  test('Valid Login Form Test', () {
    var result = Validator.validateLoginForm('124', '123');
    expect(result, true);
  });
}
