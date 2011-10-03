export CLASSPATH=./classes:./testclasses:./libs/asm-debug-all-4.0_RC2.jar:./libs/junit.jar:$CLASSPATH

echo making dir:  ./classes
rm -rf ./classes
rm -rf ./testclasses
mkdir ./classes
mkdir ./testclasses

echo Compiling java source ===========================================
javac -g -d ./classes `find . -name "*.java" `

echo Compiling .j files for testing ==================================
java -ea kilim.tools.Asm -d ./classes `find . -name "*.j"`

echo Weaving =========================================================
# Weave all files under ./classes, compiling the tests to
# ./testclasses while excluding any that match "ExInvalid". These are
# negative tests for the Weaver.
#java -ea kilim.tools.Weaver -v -t -d ./classes -x "ExInvalid|test" ./classes
#java -ea kilim.tools.Weaver -v -t -d ./testclasses -x "ExInvalid" ./classes
java -ea kilim.tools.Weaver -v -t -d ./out -x "ExInvalid" /Users/gburd/Projects/kilim/classes/kilim/test/ex/ExJSR.class
