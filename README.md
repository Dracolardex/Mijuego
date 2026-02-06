# Beyond the Dungeon

**Desarrollador:** Cristian Guillen Niño  
**Motor:** Godot Engine  
**Plataforma:** Windows (offline)  
**Idioma:** Español

## Enlaces

- GitHub: https://github.com/Dracolardex/Mijuego
- Itch.io: https://cristian-guillen.itch.io

---

## Descripción del Juego

Beyond the Dungeon es un RPG clásico por turnos de estilo retro inspirado en juegos como Final Fantasy. Los jugadores controlan a un caballero y una maga que luchan en grupo contra enemigos a lo largo de su aventura.

---

## Contenido Implementado

### Estructura del Proyecto

El juego cuenta con los siguientes componentes desarrollados:

**Personajes Jugables:**
- Player (Caballero/Maga) - Sistema de movimiento implementado
- Sprites de personajes (100x100 pixels)

**Enemigos:**
- Orco - Enemigo básico implementado
- Sistema de combate funcional

**NPCs:**
- NPC_Mago - Personaje no jugable con diálogos

**Escenarios:**
- MapaInterseccion - Mapa de exploración principal
- Escenario de Batalla - Arena de combate
- Assets de bosque (pixel_16_woods v2 free)
- Assets de pueblo (Pixel 16 v2 village free)
- Sistema de transiciones entre escenas

**Sistema de Combate:**
- Sistema de turnos implementado
- Proyectiles mágicos (Magic(Projectile))
- Proyectiles de flecha (Arrow(Projectile), Flecha)
- Efectos visuales de combate (Effects)

**Audio:**
- Música de fondo (Musica)
- Efectos de sonido (JDSherbert - Pixel Game Essentials SFX Pack)

**Assets Visuales:**
- Archivos fuente de Aseprite
- Tilesets PNG para mapas (PNG_n_Tiled)
- Sprites animados de personajes y enemigos

### Controles

**Exploración:**
- **WASD:** Movimiento del personaje por el mundo

**Combate:**
- **F:** Seleccionar a la maga y elegir enemigo para atacar
- **G:** Seleccionar al caballero y elegir enemigo para atacar

### Características Técnicas

- Archivos GDScript para lógica del juego (Main.gd)
- Configuración del proyecto Godot (project.godot)
- Sistema de animaciones y sprites
- Sistema de colisiones y áreas
- Sistema de transiciones entre escenas

---

## Game Design Document (GDD) - Plan Original

### Concepto Original

El GDD original planteaba una experiencia RPG completa con las siguientes características:

### Objetivo Principal del Desarrollo
- Crear un juego para practicar habilidades con Godot Engine
- Desarrollar un primer juego simple y corto
- Completar el proyecto en una semana (fecha límite: 5 de Febrero de 2026)

### Experiencia Deseada
El juego debía transmitir:
- Sentimiento de fantasía en un mundo mágico
- Nostalgia a través de estilo retro marcado
- Sensación de libertad con recompensas ocultas en el entorno

### Sistema de Estadísticas Planeado

Cada personaje debía tener 5 estadísticas:
- **Vida:** Puntos de salud del personaje
- **Daño (Fuerza):** Cantidad de daño al atacar
- **Defensa:** Capacidad para resistir ataques
- **Velocidad:** Capacidad para esquivar ataques
- **Agilidad:** Stamina para acciones especiales

### Balanceo de Personajes Planeado
- **Mago/a:** Alto daño, baja defensa
- **Caballero/a:** Alta defensa, baja velocidad

### Sistema de Combate Planeado
1. Turnos comenzando siempre por el jugador
2. Acciones con ambos personajes antes del turno enemigo
3. Ciclo repetido hasta victoria de un bando

### Contenido Planificado

**Estructura de Aventura:**
- 4-5 combates antes del jefe final
- Máximo 2-3 zonas para explorar
- Jefe final extremadamente poderoso (diseñado para ser imbatible)
- Aventura tipo "one shot" con final imposible

**Sistemas Adicionales Planificados:**
- Sistema de subida de nivel
- Sistema de inventario completo
- Sistema de armas
- Sistema de objetos/ítems consumibles
- Diálogos extensos entre personajes
- NPCs de relleno para dar vida al mundo
- Recompensas ocultas en el entorno

**Ambientación:**
- Mundo medieval con elementos de fantasía
- Detalles típicos de RPG clásico
- Estilo pixel art retro

---

## Características No Implementadas

Debido a las limitaciones de tiempo y la curva de aprendizaje con Godot, los siguientes elementos del GDD no pudieron ser completados:

### Sistemas de Juego
- Sistema completo de estadísticas (solo implementación parcial)
- Sistema de subida de nivel
- Sistema de inventario funcional
- Sistema de armas equipables
- Sistema de objetos/ítems consumibles
- Mecánica de esquiva basada en velocidad
- Sistema de agilidad/stamina para habilidades especiales

### Contenido
- Jefe final imbatible
- 4-5 combates planificados (número reducido en versión final)
- Múltiples zonas de exploración (reducido a 1-2 zonas)
- Diálogos extensos entre personajes (solo diálogos básicos)
- Recompensas ocultas en el entorno
- NPCs adicionales de relleno

### Balanceo y Progresión
- Sistema de progresión de personajes
- Diferenciación completa de estadísticas entre clases
- Curva de dificultad gradual

---

## Desafíos del Desarrollo

El proyecto enfrentó varios obstáculos durante su desarrollo:

1. **Tiempo Limitado:** Solo una semana de desarrollo
2. **Experiencia Mínima:** Primera vez usando Godot Engine
3. **Alcance Ambicioso:** El GDD planteaba características complejas para el tiempo disponible
4. **Búsqueda de Assets:** Necesidad de encontrar sprites, tiles y recursos compatibles

---

## Recursos Utilizados

### Escenarios y Mapas
- Pixel Art Forest Asset Pack: https://zedpxl.itch.io/pixelart-forest-asset-pack
- Damp Dungeons: https://arex-v.itch.io/damp-dungeons
- Pixel Art Village Top-Down RPG Asset Pack: https://zedpxl.itch.io/pixelart-village-top-down-rpg-asset-pack

### Sprites de Personajes
- Tiny RPG Character Asset Pack: https://zerie.itch.io/tiny-rpg-character-asset-pack

### Música y Sonido
- OpenGameArt.org: https://opengameart.org
- JDSherbert - Pixel Game Essentials SFX Pack (FREE)

### Sistema de Menús
- Godot Game Template: https://github.com/Maaack/Godot-Game-Template

---

## Instalación y Ejecución

1. Clona este repositorio:
   ```bash
   git clone https://github.com/Dracolardex/Mijuego.git
   ```
2. Abre el proyecto en Godot Engine (versión 4.x recomendada)
3. Ejecuta el proyecto desde el editor (F5) o exporta para Windows

---

## Notas Finales

Este proyecto representa un esfuerzo de aprendizaje con Godot Engine. Aunque no se implementaron todas las características del GDD original, el juego cumple con su objetivo principal: servir como proyecto de práctica para desarrollar habilidades de desarrollo de videojuegos.

La experiencia adquirida durante este desarrollo incluye:
- Implementación de sistemas de combate por turnos
- Manejo de escenas y transiciones
- Integración de sprites y animaciones
- Sistema básico de proyectiles
- Gestión de audio y efectos visuales

**Público Objetivo:** Jugadores que disfrutan de RPGs retro y experiencias pixel art, especialmente aquellos interesados en ver proyectos de aprendizaje de desarrollo de videojuegos.

---

## Licencia

Este proyecto es de código abierto y está disponible para fines educativos y de aprendizaje. Los assets utilizados mantienen sus respectivas licencias originales.

**Nota:** Este es un proyecto de práctica. El código y los assets pueden no estar optimizados para producción.

---

**Nota:** Este es un proyecto de práctica desarrollado para aprender a usar Godot Engine. El código y los assets pueden no estar optimizados para producción.
