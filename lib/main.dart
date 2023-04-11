import 'package:flutter/material.dart';

class MeuTitulo extends StatelessWidget implements PreferredSizeWidget {

  const MeuTitulo();
  void widgetFoiTocado() {
    print("Tocaram no widget do AppBar");
  }

  @override

  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: widgetFoiTocado,
        child: const Text("Título"),
      ),
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MinhaCaixa extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  MinhaCaixa({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(text, textAlign: TextAlign.center),
          )
        )
    );
  }
}

class NewNavBar extends StatelessWidget {
  const NewNavBar({super.key});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class MyApp extends StatelessWidget {

  const MyApp();

  void appFoiTocado() {
    print("Tocaram no objeto app");
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: const MeuTitulo(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Expanded(
                child: MinhaCaixa(
                  onTap: () => print("La Fin Du Monde - Bock - 65 ibu"),
                  text: "La Fin Du Monde - Bock - 65 ibu"),
              ),
              Expanded(
                child: MinhaCaixa(
                  onTap: () => print("Sapporo Premiume - Sour Ale - 54 ibu"),
                  text: "Sapporo Premiume - Sour Ale - 54 ibu",
                ),
              ),
              Expanded(
                child: MinhaCaixa(
                  onTap: () => print("Duvel - Pilsner - 82 ibu"),
                  text: "Duvel - Pilsner - 82 ibu",
                )
              )
            ]
          ),
        ),

        bottomNavigationBar: const NewNavBar(),

      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

