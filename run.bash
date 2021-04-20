# Trap ========================================================================

trap cntrl_c SIGINT

# Define variables ============================================================

# URL of the Marco Geoestadístico 2020 integrado
readonly DATA_URL=https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/geografia/marcogeo/889463807469/mg_2020_integrado.zip

# Name of the downloaded zip file containing the marco integrado
readonly MARCOINTEGRADO_NAME=marco_integrado.zip

# Name of the dir where data is going to be downloaded and extracted
readonly DATA_PATH="Data"

# Path of the downloaded zip file containing the marco integrado
readonly MARCOINTEGRADO_PATH="$DATA_PATH/$MARCOINTEGRADO_NAME"

# Name of the dir where the marco integrado will be uncompressed
readonly MARCOINTEGRADO_UNCOMPRESSED_NAME="${MARCOINTEGRADO_NAME%.*}_uncompressed"

# Path of the dir where the marco integrado will be uncompressed
readonly MARCOINTEGRADO_UNCOMPRESSED_PATH="$DATA_PATH/$MARCOINTEGRADO_UNCOMPRESSED_NAME"

# Define functions ============================================================

# Function to log a message to the stdout
# Arg1: Level
# Arg2: Msg
log_msg() {
    # Define locals
    local LEVEL=${1:="INFO"}
    local MSG=${2:=""}
    # Echo msg
    echo "$(date) | $LEVEL : $MSG"
} 

# Function to trap Cntrl-C
cntrl_c() {
    log_msg "ERROR" "El usuario terminó la ejecución del script."
    exit 1;
}

main() {
    # Log
    log_msg "INFO" "Rutina iniciada."

    # Download data -------------------
    log_msg "INFO" "Descargando marco integrado..."
    # source Bin/get_data.bash || { log_msg "ERROR" "Ocurrió un error al momento de descargar el marco integrado."; exit 1; }
    log_msg "INFO" "Listo. Marco integrado descargado."

    # Uncompress data -----------------
    log_msg "INFO" "Descomprimiendo marco integrado..."

    # Create dir
    mkdir -p "$MARCOINTEGRADO_UNCOMPRESSED_PATH"

    # Unzip
    unzip $MARCOINTEGRADO_PATH -d "$MARCOINTEGRADO_UNCOMPRESSED_PATH" || { log_msg "ERROR" "Ocurrió un error al momento de descomprimir el marco integrado."; exit 1; }
    log_msg "INFO" "Listo. Marco integrado descomprimido."

    # Rename data ---------------------
    log_msg "INFO" "Renombrando archivos..."
    source Bin/rename.bash || { log_msg "ERROR" "Ocurrió un error al momento de renombrar los componentes del marco integrado."; exit 1; }

}

# Run =========================================================================

main