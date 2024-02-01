import 'package:flutter/foundation.dart';

mixin EmitterMixin<T> on ValueNotifier<T> {
  emit(T state) {
    value = state;
  }
}
