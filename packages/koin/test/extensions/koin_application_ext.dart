import 'package:koin/koin.dart';
import 'package:koin/src/core/instance/instance_factory.dart';
import 'package:test/test.dart';
import 'package:kt_dart/kt.dart';
import 'package:koin/internal.dart';

extension KoinApplicationEx<T> on KoinApplication {
  void expectDefinitionsCount(int count) {
    expect(koin.scopeRegistry.size(), count);
  }

  BeanDefinition<T> getBeanDefinition(Type type) {
    return koin.scopeRegistry.rootScope.scopeDefinition.definitions
        .firstOrNull((it) => it.primaryType == type);
  }

  InstanceFactory getInstanceFactory(Type type) {
    return koin.scopeRegistry.rootScope
        .getAllInstanceFactory()
        .firstOrNull((it) => it.beanDefinition.primaryType == type);
  }
}

extension ScopeEx<T> on Scope {
  BeanDefinition<T> getBeanDefinition(Type type) {
    return scopeDefinition.definitions
        .firstOrNull((it) => it.primaryType == type);
  }

  InstanceFactory getInstanceFactory(Type type) {
    return getAllInstanceFactory()
        .firstOrNull((it) => it.beanDefinition.primaryType == type);
  }
}
