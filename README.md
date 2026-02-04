# Beyond the Dungeon

Proyecto de juego desarrollado con Godot Engine. Este repositorio contiene el codigo fuente y los recursos necesarios para el funcionamiento del juego, incluyendo el sistema de movimiento del jugador y el primer nivel de entorno.

## Estructura del Proyecto

El proyecto esta organizado en las siguientes carpetas y archivos principales:

- **Characters(100x100)**: Contiene los sprites de los personajes con una resolucion base de 100x100 pixeles.
- **Player**: Carpeta que almacena la escena del jugador (Player.tscn) y su logica principal.
- **pixel_16_woods v2 free**: Recursos graficos del entorno de bosque con una rejilla de 16x16 pixeles.
- **project.godot**: Archivo de configuracion principal del motor Godot.
- **soldier.gd**: Script en GDScript que controla el comportamiento y movimiento del soldado.

## Caracteristicas Implementadas

- **Control del Jugador**: Movimiento fluido utilizando las teclas WASD o flechas de direccion mediante el sistema de Input Map de Godot.
- **Sistema de Animaciones**: Implementacion de AnimationTree con StateMachine para transiciones entre estados de reposo (Idle) y movimiento (Walk).
- **Manejo de Sprites**: Uso de SpriteSheets (hojas de sprites) configuradas mediante Hframes y Vframes para una animacion eficiente con un solo archivo PNG.
- **Escenario Base**: Creacion del mapa Interseccion utilizando TileMaps con multiples capas (Background y Foreground) para dar profundidad al entorno.

## Requisitos de Instalacion

1. Descargar e instalar Godot Engine (version 4.x recomendada).
2. Clonar este repositorio o descargar los archivos.
3. Abrir Godot y seleccionar "Importar".
4. Navegar hasta la carpeta del proyecto y seleccionar el archivo project.godot.

## Configuracion de Desarrollo

Para evitar errores de importacion o nodos no encontrados al colaborar en el proyecto, se recomienda:

- Mantener el archivo .gitignore actualizado para no subir la carpeta .godot local.
- Asegurarse de que los nombres de los nodos en el AnimationTree coincidan exactamente con las llamadas en el script (respetando mayusculas y minusculas).
- Configurar el tamaño de la rejilla en 16x16 para los tilesets de bosque.
