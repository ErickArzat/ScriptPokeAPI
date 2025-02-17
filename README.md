# ScriptPokeAPI

Este repositorio contiene un script en **Bash** que permite consultar la **PokeAPI** para obtener información sobre un Pokémon específico. Los datos extraídos incluyen su **ID, nombre, peso, altura y orden**, y se almacenan en un archivo CSV.

## 📌 Requisitos

Para ejecutar este script correctamente, necesitas:

- `curl`: Para realizar solicitudes HTTP a la API.
- `jq`: Para procesar los datos JSON obtenidos de la API.

Puedes instalarlos con los siguientes comandos:

```bash
sudo apt install curl jq      # En distribuciones basadas en Debian (Ubuntu, etc.)
sudo dnf install curl jq      # En Fedora
brew install curl jq          # En macOS (usando Homebrew)
```

## 🚀 Instalación y Uso

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/ErickArzat/ScriptPokeAPI.git
   ```
2. **Ejecutar el script con un nombre de Pokémon:**
   ```bash
   bash pokescript.sh <nombre_pokemon>
   ```

## 📋 Ejemplo de Salida

```bash
Ditto (No. 132)
Id = 132
Weight = 40
Height = 4
```

## 📁 Archivo CSV

Los datos extraídos se guardan en `pokemon_data.csv` en formato:

```csv
id,name,weight,height,order
25,pikachu,60,4,35
1,bulbasaur,69,7,1
```

## ⚠️ Manejo de Errores

- Si el Pokémon no existe:
  ```bash
  Error: No se encontró el Pokémon <nombre_pokemon>.
  ```
- Si `jq` no está instalado, el script fallará. Instálalo antes de ejecutarlo.
  

✨ *Hecho por ErickArzat* 🚀

