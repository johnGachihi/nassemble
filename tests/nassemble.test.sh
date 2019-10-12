GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

test="Call nassemble without required file arguement"
if nassemble | grep -q '.asm file parameter required'; then
  echo -e \"$test\". ${GREEN}Test PASSED
else
  echo -e \"Call nassemble without required file parameter\". ${RED}Test FAILED
fi


#Call nassemble with arguement
