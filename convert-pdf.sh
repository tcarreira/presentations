#!/bin/sh

if [ $# -lt 1 ]; then
  echo "Usage: $0 <sourcefile.html> [<destfilename.pdf>]"
  exit 1
fi

cd "$(dirname $1)"

htmlfile=$(basename "$1")
if [ $# -gt 1 ]; then
  pdffile="$2"
else
  pdffile=$(echo "$htmlfile" | sed 's/.[^.]*$/.pdf/')
fi
if [ "$htmlfile" = "$pdffile" ]; then
  echo "PDF file cannot be the same as the input file"
  exit 1
fi
if [ -f "$pdffile" ]; then
  echo -n "Overwrite $pdffile [y/N]? "
  read response
  case $response in
    [Yy]*) : ;;
    *)     exit 1;;
  esac
fi

docker run --rm -t -u "$(id -u):$(id -g)" -v "$(pwd):/host" astefanutti/decktape "/host/$htmlfile" "/host/$pdffile"

