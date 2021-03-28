import 'package:blocpattern/view/counter/counter_state.dart';
import 'package:blocpattern/view/theme/change_theme_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // statemizi burada oluşturduk.

    final CounterState state = Provider.of<CounterState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter View"),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
                stream: state.counter,
                builder: (context, snap) {
                  // eger state de bir hata varsa
                  if (snap.hasError) {
                    return Text(
                      snap.error,
                      style: TextStyle(color: Colors.red, fontSize: 50),
                    );
                  }
                  // state de data varsa
                  if (snap.hasData) {
                    return Text(
                      snap.data.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  }
                  // state null ise, biz başlangıç degeri 0 atadıgımızdan bu hiç calışmaz
                  return CircularProgressIndicator();
                }),
            TextButton(
                onPressed: () {
                  // burada hata gönderiyoruz
                  state.counterAddError("Hata");
                },
                child: Text("Hata Gönder")),
            TextButton(
                onPressed: () {
                  // eger hata atarsak degerimiz null olur
                  // bu yüzden bunu kontrol ediyoruz
                  if (state.currentCounter != null) {
                    // statedek mevcut degeri alıyoruz
                    int currentValue = state.currentCounter;
                    // ve 1 artırıyoruz
                    state.changeCounter(currentValue + 1);
                  } else {
                    // null ise direk 1 gönderiyorum
                    state.changeCounter(1);
                  }
                },
                child: Text("Artır")),
            TextButton(
                onPressed: () {
                  // yukarıdaki işlemin aynısı
                  if (state.currentCounter != null) {
                    state.changeCounter(state.currentCounter - 1);
                  } else {
                    state.changeCounter(0);
                  }
                },
                child: Text("Azalt")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChangeTheme();
          }));
        },
        child: Icon(Icons.three_mp),
      ),
    );
  }
}
