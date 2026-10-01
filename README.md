# GoogleBar para Rainmeter

Barra de búsqueda de Google estilo Android para el escritorio de Windows, en **negro** y **blanco**.

## Funciones
- Clic en *Buscar en Google...* → escribes y **Enter** busca en Google.
- 🎤 **Micrófono** → abre Google en Chrome y activa la búsqueda por voz automáticamente.
- 📷 **Lens** → abre Google Lens.
- Logo oficial de la G descargado directamente de Google.
- Arrastrable, se queda en el escritorio y no tapa ventanas.

## Instalación
1. Instala **Rainmeter** desde la web oficial: https://www.rainmeter.net
2. Descarga [`release/GoogleBar_2.0.rmskin`](release/GoogleBar_2.0.rmskin) y haz doble clic → **Install**.
3. Se carga la versión negra. Para cambiar a la blanca:
   clic derecho en la barra → **Variantes** → `Blanco.ini`.

Instalación manual: copia `Skins/GoogleBar` en `Documentos\Rainmeter\Skins\` y pulsa *Actualizar todo*.

## Requisitos
- Windows 10/11, Rainmeter 4.5+, Google Chrome (para la voz).
- Internet la primera vez (descarga del logo).

## Ajustes
- **Colores / transparencia:** sección `[Variables]` de `Negro.ini` o `Blanco.ini`.
- **El micro no se activa:** en `@Resources/Scripts/voz.ps1` sube `$Espera` (p. ej. 4000).

## Estructura
```
Skins/GoogleBar/
├── Negro.ini
├── Blanco.ini
└── @Resources/
    ├── shadow.png
    └── Scripts/
        ├── GoogleBar.lua   (codifica la búsqueda)
        └── voz.ps1         (búsqueda por voz en Chrome)
release/GoogleBar_2.0.rmskin
```

Google, el logo de Google y Google Lens son marcas de Google LLC. Proyecto personal sin afiliación.
