


while getopts "h" opt; do
  case $opt in
    h)
      echo "copy_virtuoso_library: Copy external lib to your envourment
      Usage:  copy_virtuoso_library.sh [OPTIONS] LIBRARY_FOLDER_PATH ENV_FOLDER_PATH"
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
    echo "Option -$OPTARG requires an argument." >&2
    exit 1
    ;;
  esac
done
LIBRARY_FOLDER_PATH=$(readlink -f $1)
ENV_FOLDER_PATH=$(readlink -f $2)

cp -r $LIBRARY_FOLDER_PATH $ENV_FOLDER_PATH/
echo "DEFINE $LIBRARY_FOLDER_PATH $ENV_FOLDER_PATH"
