# Create output dir
mkdir -p Data

# Download using wget
# -q --show-progress forces wget to only show the progress bar
wget -q --show-progress $DATA_URL -O $MARCOINTEGRADO_PATH