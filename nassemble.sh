# Param $1 => asm file full path

#Check if parameter is provided
if [ -z ${1+x} ]; then
  echo '.asm file parameter required'
  exit 1
fi

filenameWOP=$(basename $1)			#filename WithOut Path

echo

if ! nasm -f elf $1; then
  exit 1
fi

echo 1. $filenameWOP assembled.

filenameWOE="${filenameWOP%.*}"			#filename WithOut Extension
filePathWOE="${1%.*}"				#filePath WithOut Extension

ld -m elf_i386 -o $filePathWOE "${filePathWOE}.o"
ld_retVal=$?

if [ $ld_retVal -ne 0 ]; then
  exit $ld_retVal
fi

echo 2. "${filenameWOE}.o" linked

echo
echo ">>>>>"

if [[ "$1" = /* ]]; then
  echo This is an absolute path
  filePathWOE="${filePathWOE:1}"
fi

./$filePathWOE;
retVal=$?

rm $filePathWOE
rm "${filePathWOE}.o"

exit $retVal
