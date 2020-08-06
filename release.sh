#!/bin/sh

FDNLS=../../FreeDOS/FD-NLS/v8power

ls ${FDNLS}

# PRERELEASE='.pre'

DESTINATION='Downloads'
RELEASE=0
FORMAT='zip'
PROJECT=$(echo ${PWD##*/})
TODAY=$(date +'%Y-%m-%d')
VERSION=$(date +'%y.%m.%d')


[[ -d "${HOME}/${DESTINATION}/${PROJECT}" ]] && rm -rf "${HOME}/${DESTINATION}/${PROJECT}"

# Standard binaries release
touch BIN/*

mkdir -p "${HOME}/${DESTINATION}/${PROJECT}"
cp -r BIN/* "${HOME}/${DESTINATION}/${PROJECT}/"
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/DEMOS"
cp -r DEMOS/* "${HOME}/${DESTINATION}/${PROJECT}/DEMOS/"
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/EXAMPLES"
cp -r EXAMPLES/* "${HOME}/${DESTINATION}/${PROJECT}/EXAMPLES/"

ARCHIVE="${PROJECT}-${VERSION}-${RELEASE}${PRERELEASE}.${FORMAT}"
while [[ -f "${HOME}/${DESTINATION}/${ARCHIVE}" ]] ; do
	(( RELEASE++ ))
	ARCHIVE="${PROJECT}-${VERSION}-${RELEASE}${PRERELEASE}.${FORMAT}"
done

if [[ -f 'LICENSE' ]] ; then
	cp 'LICENSE' "${HOME}/${DESTINATION}/${PROJECT}/LICENSE.txt"
fi;
if [[ -f "${FDNLS}/help/v8power.en" ]] ; then
	cp "${FDNLS}/help/v8power.en" "${HOME}/${DESTINATION}/${PROJECT}-README.txt"
    mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/HELP"

	cp "${FDNLS}/help/"* "${HOME}/${DESTINATION}/${PROJECT}/HELP/"
fi;
if [[ -f 'CONTRIB.md' ]] ; then
	cp 'CONTRIB.md' "${HOME}/${DESTINATION}/${PROJECT}/CONTRIB.md"
fi;

CURDIR="$PWD"
cd "${HOME}/${DESTINATION}"
if [[ "$FORMAT" == "zip" ]] ; then
	zip -9 -r "${ARCHIVE}" "${PROJECT}/"*
fi;
cd "${CURDIR}"

rm -rf "${HOME}/${DESTINATION}/${PROJECT}"

# Package Release
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}"
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/APPINFO"
[[ ${RELEASE} == 0 ]] && RNAME=${VERSION} || RNAME=${VERSION}-${RELEASE}
cat SOURCE/APPINFO.LSM | sed 's/\$VERSION\$/'${RNAME}/g | sed 's/\$DATE\$/'${TODAY}/g > "${HOME}/${DESTINATION}/${PROJECT}/APPINFO/${PROJECT}.LSM"

mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/BIN"
cp -r BIN/* "${HOME}/${DESTINATION}/${PROJECT}/BIN"
[[ -e "${HOME}/${DESTINATION}/${PROJECT}/BIN/LICENSE" ]] && rm "${HOME}/${DESTINATION}/${PROJECT}/BIN/LICENSE"
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/DOC/${PROJECT}"
cp -r *.txt   "${HOME}/${DESTINATION}/${PROJECT}/DOC/${PROJECT}"
cp -r LICENSE "${HOME}/${DESTINATION}/${PROJECT}/DOC/${PROJECT}"
cp -r CONTRIB.md "${HOME}/${DESTINATION}/${PROJECT}/DOC/${PROJECT}"
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/SOURCE/${PROJECT}"
cp -r * "${HOME}/${DESTINATION}/${PROJECT}/SOURCE/${PROJECT}"
rm -rf "${HOME}/${DESTINATION}/${PROJECT}/SOURCE/${PROJECT}/BIN"
mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/HELP"
if [[ -f "${FDNLS}/help/v8power.en" ]] ; then
	cp "${FDNLS}/help/v8power.en" "${HOME}/${DESTINATION}/${PROJECT}/DOC/${PROJECT}/README.txt"
    mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/HELP"
	cp "${FDNLS}/help/"* "${HOME}/${DESTINATION}/${PROJECT}/HELP/"
fi;

mkdir -p "${HOME}/${DESTINATION}/${PROJECT}/SOURCE/${PROJECT}/SOURCE"
cp -r SOURCE/* "${HOME}/${DESTINATION}/${PROJECT}/SOURCE/${PROJECT}/SOURCE"

lcase=$(echo "${PROJECT}" | tr '[:upper:]' '[:lower:]')
cd "${HOME}/${DESTINATION}"
[[ -f "${lcase}.zip" ]] && rm "${lcase}.zip"
cd "${PROJECT}"
rm "BIN/V8POWER.TXT" >/dev/null
zip -9 -r -k "../${lcase}.zip" *
cd "${CURDIR}"

rm -rf "${HOME}/${DESTINATION}/${PROJECT}"

echo "${HOME}/${DESTINATION}/${ARCHIVE}"
echo "${HOME}/${DESTINATION}/${PROJECT}.zip"
