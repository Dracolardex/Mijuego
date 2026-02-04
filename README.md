# Beyond The Dungueon

Un proyecto de videojuego desarrollado en **Godot 4.x**. El juego busca implementar mecánicas de exploración y un sistema de combate dinámico utilizando la potencia de los nodos y GDScript.

## Estado del Proyecto: Desarrollo Activo
Actualmente el proyecto está en fase de prototipo, enfocándose en la integración de escenas y la lógica de interacción.

### Sistema de Combate (En Proceso)
El archivo de la **zona de combate** está siendo desarrollado actualmente. 
* **Estado actual:** El código base de la escena de combate está planteado pero incompleto a nivel de funciones de daño y transiciones.
* **Pendiente:** Implementar la lógica de señales (Signals) para conectar la interfaz de usuario con las acciones de los personajes.
* **Arquitectura:** Uso de nodos `Node2D` / `Control` para la gestión de la batalla.

## Estructura del Repositorio
* **`Escenas/`**: Contiene los archivos `.tscn` de los niveles y menús.
* **`Scripts/`**: Archivos `.gd` con la lógica de movimiento, combate e IA.
* **`Assets/`**: Recursos visuales y auditivos del juego.

## Cómo probarlo
1. Descarga o clona este repositorio.
2. Abre **Godot Engine 4.x**.
3. Importa el archivo `project.godot`.
4. Pulsa `F5` para ejecutar la escena principal.

## Hoja de Ruta (Roadmap)
- [ ] Finalizar el script de la zona de combate.
- [ ] Conectar la exploración del mundo con la entrada a batalla.
- [ ] Añadir sistema de diálogo básico.

---
**Desarrollado por:** [Dracolardex](https://github.com/Dracolardex)
