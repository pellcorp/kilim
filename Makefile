
all:
	mvn compile -e

clean:
	mvn clean
	@rm -rf ./tmp

test:
	@rm -rf /tmp/woven-classes
	@mkdir /tmp/woven-classes
	java -ea -cp ./classes:./libs/asm-debug-all-4.0.jar kilim.tools.Weaver -x "ExInvalid|test" ./classes -d ./tmp/woven-classes
	echo "Testing Kilim Weaver"
	java -ea -cp ./classes:./libs/asm-debug-all-4.0.jar:./libs/junit.jar junit.textui.TestRunner kilim.test.AllNotWoven
	echo "Task, mailbox tests"
	java -Dkilim.Scheduler.numThreads=16 -cp ./tmp/woven-classes:./classes:./libs/asm-debug-all-4.0.jar:./libs/junit.jar junit.textui.TestRunner kilim.test.AllWoven


#### Helpful targets

mvn-install-asm4:
	mvn install:install-file -Dfile=libs/asm-debug-all-4.0.jar -DgroupId=asm -DartifactId=asm-all -Dversion=4.0 -Dpackaging=jar

#### These targets are here as a record of what the old build.sh script would do,
#### you'll never use them.  Just ignore this and someday it will be pruned and
#### you won't know the difference. :)

CLASSPATH=./classes:./testclasses:./libs/asm-debug-all-4.0.jar:./libs/junit.jar:$CLASSPATH

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
