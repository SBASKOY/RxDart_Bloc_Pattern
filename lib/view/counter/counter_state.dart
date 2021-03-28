import 'package:rxdart/rxdart.dart';

class CounterState {
  // counter değişkenimiz oluştur.
  // seeded fonsiyonu ile başlangıç degerini 0 olarak atadık
  //  final _counter = new BehaviorSubject<int>();
  // bu şekilde de yapabilirdik ama başlangıç degeri null olurdu
  final _counter = new BehaviorSubject<int>.seeded(0);

  // degişikleri dinlemek için bunu kullanacagız
  Stream<int> get counter => _counter.stream;
  // değişkenimizin mevcut degerini bize döndürecek
  int get currentCounter => _counter.value;
  // değişkenimize yeni deger atamak için kullanacagız
  Function(int) get changeCounter {
    return _counter.sink.add;
  }
  // bu ise hata döndürmemize yarıyor 
  Function(String) get counterAddError {
    return _counter.sink.addError;
  }

  dispose() {
    _counter.close();
  }
}
