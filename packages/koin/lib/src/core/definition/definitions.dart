import '../qualifier.dart';
import 'bean_definition.dart';
import '../scope/scope_definition.dart';
import '../definition/options.dart';

class Definitions {
  static BeanDefinition<T> saveSingle<T>(
      Qualifier qualifier,
      Definition<T> definition,
      ScopeDefinition scopeDefinition,
      Options options) {
    var beanDefinition =
        createSingle(qualifier, definition, scopeDefinition, options);
    scopeDefinition.save(beanDefinition);
    return beanDefinition;
  }

  static BeanDefinition<T> createSingle<T>(
      Qualifier qualifier,
      Definition<T> definition,
      ScopeDefinition scopeDefinition,
      Options options,
      [List<Type> secondaryTypes]) {
    return BeanDefinition(
        scopeDefinition: scopeDefinition,
        primaryType: T,
        qualifier: qualifier,
        definition: definition,
        kind: Kind.Single,
        options: options,
        secondaryTypes: secondaryTypes);
  }

  static BeanDefinition createSingleWithType(Type type, Qualifier qualifier,
      Definition definition, ScopeDefinition scopeDefinition, Options options,
      [List<Type> secondaryTypes]) {
    return BeanDefinition(
        scopeDefinition: scopeDefinition,
        primaryType: type,
        qualifier: qualifier,
        definition: definition,
        kind: Kind.Single,
        options: options,
        secondaryTypes: secondaryTypes);
  }

  static BeanDefinition<T> createFactory<T>(
      Qualifier qualifier,
      Definition<T> definition,
      ScopeDefinition scopeDefinition,
      Options options,
      [List<Type> secondaryTypes]) {
    return BeanDefinition(
        scopeDefinition: scopeDefinition,
        primaryType: T,
        qualifier: qualifier,
        definition: definition,
        kind: Kind.Factory,
        options: options,
        secondaryTypes: secondaryTypes);
  }

  static BeanDefinition<T> saveFactory<T>(
      Qualifier qualifier,
      Definition<T> definition,
      ScopeDefinition scopeDefinition,
      Options options) {
    var beanDefinition =
        createFactory(qualifier, definition, scopeDefinition, options);
    scopeDefinition.save(beanDefinition);
    return beanDefinition;
  }
}
