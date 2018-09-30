#!/usr/bin/env bash

# Download, extract JDK dmg and move Java home folder inside it to a custom location.
# Reference: https://stackoverflow.com/questions/15217200/how-to-install-java-7-on-mac-in-custom-location

echo "Usage: extract_jdk.sh [JDK major version] [JDK update version] [JDK download url]"
echo "Parameters:"
echo "[JDK major version]: 7 or 8, single digit."
echo "[JDK update version]: minor version, also digits."

JDK_MAJOR_VERSION=$1
JDK_UPDATE_VERSION=$2
JDK_DOWNLOAD_URL=$3

if [[ $JDK_MAJOR_VERSION == "8" ]]; then
    JDK_SAVE_PATH=$USER_DOWNLOADS/jdk8-macosx.dmg
    TARGET_EXTRACTION_LOCATION=$JVM_DIR/jdk8
else
    echo "Unsupport JDK major version: ${JDK_MAJOR_VERSION}"
    exit 1
fi

TMP_MOUNT_DIR=$USER_DOWNLOADS/jdk_dmg_mount_tmp
TMP_EXTRACTED_DIR=$USER_DOWNLOADS/jdk_dmg_extracted_tmp

# In case tmp folder already exists and is not empty
rm -rf $TMP_MOUNT_DIR
mkdir -p $TMP_MOUNT_DIR

# Do not create tmp extraction dir beforehand otherwise you'll encounter a "File exists" error
rm -rf $TMP_EXTRACTED_DIR

# Download JDK
curl --cookie "oraclelicense=accept-securebackup-cookie" -o $JDK_SAVE_PATH -L $JDK_DOWNLOAD_URL

# Mount dmg
hdiutil attach -mountpoint $TMP_MOUNT_DIR -verbose $JDK_SAVE_PATH

# Extract JDK home folder and move it to custom location
pkgutil --expand $TMP_MOUNT_DIR/JDK\ $JDK_MAJOR_VERSION\ Update\ $JDK_UPDATE_VERSION/.pkg $TMP_EXTRACTED_DIR

# Extract payload (a GZipped CPIO file), this step would take some time...
cd $TMP_EXTRACTED_DIR
cpio -iv < ./jdk1${JDK_MAJOR_VERSION}0${JDK_UPDATE_VERSION}.pkg/Payload

if [[ -d $TARGET_EXTRACTION_LOCATION ]]; then
    mv $TARGET_EXTRACTION_LOCATION ${TARGET_EXTRACTION_LOCATION}_origin
else
    rm -f $TARGET_EXTRACTION_LOCATION
fi

mv Contents/Home $TARGET_EXTRACTION_LOCATION

# Unmount dmg
hdiutil detach -force -verbose $TMP_MOUNT_DIR
rm -rf $TMP_MOUNT_DIR

# Remove tmp extraction folder
rm -rf $TMP_EXTRACTED_DIR
