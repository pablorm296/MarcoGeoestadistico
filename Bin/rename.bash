## Define variables ==========================================================
# This is a dirty hack for capturing func output without spawning a child process
NEW_FILE_NAME=""

## Define functions ==========================================================

# Function to rename
# Arg1: Original file name
# Arg2: New name
rename() {
    # Define locals
    local ORIGINAL=$1
    local NEW=$2

    # Get extension
    local EXTENSION="${ORIGINAL##*.}"

    # Return new file name
    NEW_FILE_NAME="$NEW.$EXTENSION"

    return 0
}

## Áreas geoestadísticas estatales ============================================
log_msg "INFO" "Renombrando áreas geoestadísticas estatales..."

find $MARCOINTEGRADO_UNCOMPRESSED_PATH -type f -name '00ent*' |
    while IFS= read file_name; do
        rename "$file_name" "01_Entidades"
        log_msg "INFO" "$file_name -> $MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME"
        mv "$file_name" "$MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME" || { log_msg "ERROR" "Ocurrió un error al renombrar el archivo"; }
    done

log_msg "INFO" "Listo. Áreas geoestadísticas estatales renombradas."

## Áreas geoestadísticas municipales ==========================================
log_msg "INFO" "Renombrando áreas geoestadísticas municipales..."

find $MARCOINTEGRADO_UNCOMPRESSED_PATH -type f -name '00mun*' |
    while IFS= read file_name; do
        rename "$file_name" "02_Municipios"
        log_msg "INFO" "$file_name -> $MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME"
        mv "$file_name" "$MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME" || { log_msg "ERROR" "Ocurrió un error al renombrar el archivo"; }
    done

log_msg "INFO" "Listo. Áreas geoestadísticas municipales renombradas."

## Áreas geoestadísticas básicas urbanas y rurales ============================
log_msg "INFO" "Renombrando AGEBs..."

find $MARCOINTEGRADO_UNCOMPRESSED_PATH -type f -name '00a*' |
    while IFS= read file_name; do
        rename "$file_name" "03_AGEB"
        log_msg "INFO" "$file_name -> $MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME"
        mv "$file_name" "$MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME" || { log_msg "ERROR" "Ocurrió un error al renombrar el archivo"; }
    done

log_msg "INFO" "Listo. AGEBs renombradas."

## Polígono de localidades urbanas y rurales amanzanadas ======================
log_msg "INFO" "Renombrando polígonos de localidades amanzanadas..."

find $MARCOINTEGRADO_UNCOMPRESSED_PATH -type f -name '00l*' |
    while IFS= read file_name; do
        rename "$file_name" "04_Localidades"
        log_msg "INFO" "$file_name -> $MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME"
        mv "$file_name" "$MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME" || { log_msg "ERROR" "Ocurrió un error al renombrar el archivo"; }
    done

log_msg "INFO" "Listo. Polígonos de localidades amanzanadas renombrados."

## Localidades puntuales rurales ==============================================
log_msg "INFO" "Renombrando puntos de localidades rurales..."

find $MARCOINTEGRADO_UNCOMPRESSED_PATH -type f -name '00lpr*' |
    while IFS= read file_name; do
        rename "$file_name" "05_PuntosRurales"
        log_msg "INFO" "$file_name -> $MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME"
        mv "$file_name" "$MARCOINTEGRADO_UNCOMPRESSED_PATH/conjunto_de_datos/$NEW_FILE_NAME" || { log_msg "ERROR" "Ocurrió un error al renombrar el archivo"; }
    done

log_msg "INFO" "Listo. Puntos de localidades rurales renombrados."