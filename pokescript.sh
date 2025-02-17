# Verificar si se proporcionó un parámetro
if [ -z "$1" ]; then
    echo "Error: El script correcto es: $0 <nombre_pokemon>"
    exit 1
fi

POKEMON=$1
API_URL="https://pokeapi.co/api/v2/pokemon/$POKEMON"
OUTPUT_FILE="pokemon_data.csv"

# Consultar la API con curl y parsear la respuesta con jq
RESPONSE=$(curl -s "$API_URL")

# Verificar si la API devolvió un resultado válido
if ! echo "$RESPONSE" | jq empty > /dev/null 2>&1; then
    echo "Error: No se encontró el Pokémon '$POKEMON'."
    exit 1
fi

# Extraer datos
ID=$(echo "$RESPONSE" | jq '.id')
NAME=$(echo "$RESPONSE" | jq -r '.name')
WEIGHT=$(echo "$RESPONSE" | jq '.weight')
HEIGHT=$(echo "$RESPONSE" | jq '.height')
ORDER=$(echo "$RESPONSE" | jq '.order')

# Imprimir resultados en formato solicitado
echo "$NAME (No. $ORDER)"
echo "Id = $ID"
echo "Weight = $WEIGHT"
echo "Height = $HEIGHT"

# Crear encabezado si el archivo no existe
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "id,name,weight,height,order" > "$OUTPUT_FILE"
fi

# Agregar los datos al archivo CSV
echo "$ID,$NAME,$WEIGHT,$HEIGHT,$ORDER" >> "$OUTPUT_FILE"

