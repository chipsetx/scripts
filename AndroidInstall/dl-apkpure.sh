#! /bin/bash
# Script to download an apk from goole play store
# APkPure.com is used as actual download mirror
# You have to provide app name and app package name
# download.sh app-name app-package-name

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo -e "Usage ./download.sh app-name app-package-name"
    exit 1
fi

# COLORS
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

{ #try
  APP_NAME=`echo $1| tr '[:upper:]' '[:lower:]'` &&
  APP_PACKAGE=$2 &&
  APP_NAME=${APP_NAME// /-} &&
  content=$(curl -L https://apkpure.com/$APP_NAME/$APP_PACKAGE/download?from=details ) &&
  echo $content > downloadPage.html &&
  DOWNLOAD_URL=$( grep -o -m 1 -E "id=\"download_link\" rel=\"nofollow\" class=\"[^\"]+\" ga=\"[^\"]+\" title=\"[^\"]+\" href=\"([^\"]+)\"" downloadPage.html | cut -d \" -f 12 ) &&
  echo -e "${GREEN}-- Downloading $APP_NAME --${NC}" &&
  curl -L $DOWNLOAD_URL -o $APP_PACKAGE.apk ;
} || {
  #catch
  echo -e  "${RED} Something went wrong ${NC}" 
}
