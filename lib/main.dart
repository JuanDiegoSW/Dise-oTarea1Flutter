import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    Widget titleSection = Container( // creamos el widget titleSection
      padding: const EdgeInsets.all(32), // colocamos  el widget con padding de 32 puntos
      child: Row( //el widget tendra varios widget internos, en este caso agregamos un fila
        children: [ //los widgets hijos
          Expanded(
            /*1*/
            child: Column(//agregamos una columna
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ //dentro de nuestra columna agregamos dos widgets.
                /*2*/
                Container( // un contenedor que tendra una texto y ademas de un estilo de negrita
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text( // tenemos un texto con un color de estilo
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon( // agregamos un hijo el cual nos mostrara un icono ademas de daremos un estilo de color rojo
            Icons.star, //el icono sera una estrella pero se puede cambiar a otro icono
            color: Colors.red[500],
          ),
          const Text('41')
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ // desde aqui podremos hacer el llamado de la funcion para poder agregar el icono con su texto
        _buildButtonColumn(color, Icons.call, 'CALL'), // enviamos por parametros el color, el icono y el nombre
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding( // implementacion de la seccion de texto que sera justificado
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        textAlign: TextAlign.justify,
        ),
      
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tarea 1'),
        ), // AppBar
        body: ListView( // agregamos todos nuestros widgets en forma de lista
          children: [
            Image.asset( // para ellos primero debemos  irnos al archivo pubspec.yaml 
              'images/lake.jpg', // y agregar un assest para poder mostrar un archivo dentro un carpeta
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection, // invocacion a cada una de las secciones
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ //agregamos cada icono directamente a la columna
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text( // cada texto esta dentro de un container con un marger superior
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}