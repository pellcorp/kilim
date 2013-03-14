export CLASSPATH=./classes:./testclasses:./libs/asm-all-2.2.3.jar:./libs/junit.jar:$CLASSPATH 

echo making dir:  ./classes
rm -rf ./target
mkdir ./target
mkdir ./target/classes
mkdir ./target/testclasses

echo Compiling java source ===========================================
javac -g -d ./target/classes `find . -name "*.java" `

echo Compiling .j files for testing ==================================
java -ea kilim.tools.Asm -d ./target/classes `find . -name "*.j"`

echo Weaving =========================================================
# Weave all files under ./targetclasses, compiling the tests to
# ./testclasses while excluding any that match "ExInvalid". These are
# negative tests for the Weaver.
java -ea kilim.tools.Weaver -d ./target/classes -x "ExInvalid|test" ./target/classes
java -ea kilim.tools.Weaver -d ./target/test-classes -x "ExInvalid" ./target/classes


