abstract class Disposable {
  void dispose();
}

class DisposableBuilder extends Disposable {
  final Function disposeFunction;

  DisposableBuilder({
    required this.disposeFunction,
  });

  @override
  void dispose() {
    disposeFunction();
  }
}
