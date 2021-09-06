import 'package:flutter/material.dart';

//A Widget é/continua imutável, muda apenas o seu State
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //List<bool> selects = [false, false, false, false, false];
  List<bool> selects = List.generate(5, (index) => false);
  List<String> labels = ["Android Nativo", "iOS Nativo", "Flutter", "React Native", "Ionic"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  spacing: 10,
                  children: BuildListChips(),
                ),
                Expanded(
                  child: ListView(
                      children: buildListItens()
                  ),
                ),
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //Função para fazer os ChipItems encapsulando outra função
  List<Widget> buildListChips() => [
    createChipItem(0),
    createChipItem(1),
    createChipItem(2),
    createChipItem(3),
    createChipItem(4),
  ];

  //Outra função para fazer os ChipItems encapsulando outra função
  List<Widget>BuildListChips() =>
      labels.asMap().entries.map((entry) {
        int index = entry.key;
        return createChipItem(index);
      }).toList();

  //Função para criar ChipItems um por um
  Widget createChipItem(int index) => ChoiceChip(
      label: Text(labels[index]),
      selected: selects[index],
      onSelected: (value){
        setState(() {
          selects[index] = value;
        });
      },
    );



  //Função para construir os cards conforme o click
  List<Widget> buildListItens(){
    return [
      if (selects[0]) getNativeAndroidOption,
      if (selects[1]) getNativeiOSOption,
      if (selects[2]) getFlutterOption,
      if (selects[3]) getReactNativeOption,
      if (selects[4]) getIonicOption
    ];

  }

  Widget getNativeAndroidOption = Card(
    child: ListTile(
      leading: Image.network('https://i1.wp.com/gizmodo.uol.com.br/wp-content/blogs.dir/8/files/2019/08/android-10-google.jpg'),
      title: Text('Android Nativo',
        style: TextStyle(color: Colors.greenAccent,
        )),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getNativeiOSOption = Card(
    child: ListTile(
      leading: Image.network('https://i0.wp.com/www.telesintese.com.br/wp-content/uploads/2018/10/Logo-Apple.jpg?ssl=1'),
      title: Text('iOS Nativo'),
      subtitle: Text('Linguagens Objective-C e Swift'),
    ),
  );

  Widget getFlutterOption = Card(
    child: ListTile(
      leading: FlutterLogo(),
      title: Text('Flutter', style:
      TextStyle(
        color: Colors.blue,
      )),
      subtitle: Text('Linguagens Dart e nativas'),
    ),
  );

  Widget getReactNativeOption = Card(
    child: ListTile(
      leading: Image.network('http://victorvhpg.github.io/minicurso-react.js/slides/img/logo.png'),
      title: Text('React Native', style:
      TextStyle(
          color:Colors.lightBlue)),
      subtitle: Text('Linguagens stack web'),
    ),
  );

  Widget getIonicOption = Card(
    child: ListTile(
      leading: Image.network('https://cdn-images-1.medium.com/max/1000/1*ZU1eWct801yP-QpUJOaI6Q.png'),
      title: Text('Ionic', style:
      TextStyle(color: Colors.blueAccent)),
      subtitle: Text('Linguagens JavaScipt e TypeScript'),
    ),
  );

}
