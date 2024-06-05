import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'menu.dart';
import 'settings.dart';



class TabsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TabsScreeenState();

}

class _TabsScreeenState extends State<TabsScreen>{
  int currentPage = 0;  //variavel para indicar o indice da página atual

  late PageController pg;

  void initState(){
    super.initState();
    pg = PageController(initialPage: currentPage);
  }

  setCurrentPage(int page){
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: pg,
        children: [
          Menu(),
          settings(),
        ],
        onPageChanged: setCurrentPage,
      ),
       bottomNavigationBar: BottomNavigationBar(

                onTap: (pagina) {pg.animateToPage(pagina, duration: Duration(microseconds: 400), curve: Curves.ease,);
                },
                backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                currentIndex: currentPage,
        items: const [
             BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: 'Configurações',
          ),
        ],
      ),
    );
    
  }

}