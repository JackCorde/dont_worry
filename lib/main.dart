import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Lo primero que va a hacer la aplicacion
void main() {
  runApp(const MyApp()); //Corre la clase MyApp
}

//Crea la clase MyApp que se extiende de un Widget
class MyApp extends StatelessWidget {
  //Statelesswidget no se va a cambiar sus valores de los widgets
  //Establece el widget de inicio "home"
  const MyApp({super.key});

  @override
  //Dibuja o retorna un arbol de widgets a dibujar
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Permite que cualquier widget en la aplicacion obtenga el estado
      create: (context) => MyAppState(),
      child: MaterialApp(
        //nombre de la app
        title: 'Name App',
        //tema visual
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: Login(), //interfaz de inicio
      ),
    );
  }
}

//Define los datos que la aplicacion necesita para funcionar
class MyAppState extends ChangeNotifier {
  //Puede notificar a otros sobre sis porpios cambios
  var current = WordPair.random(); //
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Don't Worry"),
          leading: IconButton(
            icon: Icon(Icons.rectangle_sharp),
            color: Color.fromARGB(255, 60, 83, 107),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 60, right: 60),
          child: Column(children: <Widget>[
            Image.network(
              "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png",
              height: 170,
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(57, 76, 102, 1)),
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: "Correo"),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(color: const Color.fromRGBO(57, 76, 102, 1))),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, labelText: "Contraseña"),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Recuperar()),
                    );
                  },
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: 'Hola Guapo')),
                  );
                },
                child: const Text("Entrar"),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Recuperar extends StatelessWidget {
  @override
  ////método que se llama automáticamente cada vez que cambian las circunstancias del widget para que el widget esté siempre actualizado.
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Don't Worry - Recuperar"),
        leading: IconButton(
          icon: Icon(Icons.rectangle_sharp),
          color: Color.fromARGB(255, 60, 83, 107),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
        backgroundColor: Color.fromRGBO(138, 166, 191, 10),
      ),
      backgroundColor: Color.fromRGBO(138, 166, 191, 10),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png'),
              radius: 70,
            ),
          ),
          Text(
            'Recupera tu cuenta',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color:
                              Color.fromARGB(255, 7, 66, 114)), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Escribe tu correo',
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
          Container(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Recuperar"),
            ),
          ),
          Image(
              image: NetworkImage(
                  'https://pantheon.nexthink.com/wp-content/uploads/2020/10/What-is-EUEM-Illustration.png'))
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dropdownValue = "Semana Actual";
  bool condicion = false;
  List<String> dropDownOptions = [
    "Semana Actual",
    "Semana Anterior",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF9FA8DA),
        appBar: AppBar(
          title: Text('Don´t Worry About It'),
          backgroundColor: Color(0xFF9FA8DA),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  items:
                      dropDownOptions.map<DropdownMenuItem<String>>((String d) {
                    return DropdownMenuItem<String>(child: Text(d), value: d);
                  }).toList(),
                  value: _dropdownValue,
                  onChanged: dropdownCallback,
                  iconSize: 30.0,
                  iconEnabledColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: condicion,
                      onChanged: (value) {
                        setState(() {
                          condicion = value!;
                          print(condicion);
                        });
                      },
                    ),
                    Text('Retardos')
                  ],
                ),
              ],
            ),
            _createDataTable(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Horarios()),
            );
          },
          backgroundColor: Color.fromARGB(255, 23, 69, 106),
          tooltip: 'Horarios',
          child: const Icon(Icons.calendar_month),
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      dividerThickness: 1,
      dataRowHeight: 30,
      showBottomBorder: true,
      headingTextStyle: TextStyle(color: Colors.black),
      headingRowColor: MaterialStateProperty.resolveWith(
        (states) => Color(0xFF5C6BC0),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Día')),
      DataColumn(label: Text('H. Entrada')),
      DataColumn(label: Text('H. Salida'))
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('14/07/2022')),
        DataCell(Text('7:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(cells: [
        DataCell(Text('14/07/2022')),
        DataCell(Text('7:00 am')),
        DataCell(Text('7:00 pm'))
      ]),
      DataRow(
          cells: [DataCell(Text('')), DataCell(Text('')), DataCell(Text(''))]),
      DataRow(
          cells: [DataCell(Text('')), DataCell(Text('')), DataCell(Text(''))]),
      DataRow(
          cells: [DataCell(Text('')), DataCell(Text('')), DataCell(Text(''))]),
      DataRow(
          cells: [DataCell(Text('')), DataCell(Text('')), DataCell(Text(''))]),
      DataRow(
          cells: [DataCell(Text('')), DataCell(Text('')), DataCell(Text(''))])
    ];
  }
}

class Horarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 173, 190),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 151, 173, 190),
        title: Text("Don't Worry - Horarios"),
        leading: IconButton(
          icon: Icon(Icons.rectangle_sharp),
          color: Color.fromARGB(255, 60, 83, 107),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Table(
            columnWidths: {
              0: FractionColumnWidth(0.8 / 3),
              1: FractionColumnWidth(0.8 / 3),
              2: FractionColumnWidth(0.8 / 3),
            },
            border: TableBorder.all(color: Colors.white),
            children: [
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 60, 83, 107),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text('Dia',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    color: Color.fromARGB(255, 60, 83, 107),
                    child: Text('H.entrada',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 60, 83, 107),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Text('H.Salida',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 225, 238),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text('Lunes',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 225, 238),
                    ),
                    child: Text('      ',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 225, 238),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Text('      ',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 225, 238),
                ),
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Martes',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                  Container(),
                  Container(),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 225, 238),
                ),
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Miercoles',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                  Container(),
                  Container(),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 225, 238),
                ),
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    child: Text('Jueves',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                  Container(),
                  Container(),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 225, 238),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text('Viernes',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 225, 238),
                    ),
                    child: Text('     ',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 225, 238),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Text('     ',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 83, 107))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromARGB(255, 119, 182, 233),
        tooltip: 'Regresar a Registros',
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
