# Trap ========================================================================

trap cntrl_c SIGINT

# Define variables ============================================================

# URL of the Marco Geoestadístico 2020 integrado
readonly DATA_URL=https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/geografia/marcogeo/889463807469/mg_2020_integrado.zip

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
    mkdir -p Data/marco_integrado_uncompressed
    # Empty dir
    rm -rf Data/marco_integrado_uncompressed/*

    # Unzip
    unzip Data/marco_integrado.zip -d Data/marco_integrado_uncompressed || { log_msg "ERROR" "Ocurrió un error al momento de descomprimir el marco integrado."; exit 1; }
    log_msg "INFO" "Listo. Marco integrado descomprimido."

}

# Run =========================================================================
main