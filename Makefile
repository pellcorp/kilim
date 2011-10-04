
all:
	mvn compile -e

test:
	java -ea kilim.tools.Weaver -d ./classes -cp libs/asm-debug-all-4.0_RC2.jar -x "ExInvalid|test" ./classes
	echo "Testing Kilim Weaver"
	java -cp ./classes:./libs/asm-all-2.2.3.jar:./libs/junit.jar junit.textui.TestRunner kilim.test.AllNotWoven
	echo "Task, mailbox tests"
	java -Dkilim.Scheduler.numThreads=10 -cp ./testclasses:./classes:./libs/asm-all-2.2.3.jar:./libs/junit.jar junit.textui.TestRunner kilim.test.AllWoven


#### These targets are here as a record of what the old build.sh script would do,
#### you'll never use them.  Just ignore this and someday it will be pruned and
#### you won't know the difference. :)

CLASSPATH=./classes:./testclasses:./libs/asm-debug-all-4.0_RC2.jar:./libs/junit.jar:$CLASSPATH

build-setup:
	rm -rf ./classes
	rm -rf ./testclasses
	mkdir ./classes
	mkdir ./testclasses

build: build-setup
	javac -g -cp $CLASSPATH -d ./classes `find . -name "*.java" `

build-test:
	java -ea kilim.tools.Asm -cp $CLASSPATH -d ./classes `find . -name "*.j"`

weave:
	java -ea kilim.tools.Weaver -v -t -cp $CLASSPATH -d ./classes -x "ExInvalid|test" ./classes
	java -ea kilim.tools.Weaver -v -t -cp $CLASSPATH -d ./testclasses -x "ExInvalid" ./classes

weave-exjsr:
	java -ea kilim.tools.Weaver -v -t -cp $CLASSPATH -d ./out -x "ExInvalid" /Users/gburd/Projects/kilim/classes/kilim/test/ex/ExJSR.class
