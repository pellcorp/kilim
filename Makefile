
all:
	mvn compile

test:
	java -ea kilim.tools.Weaver -d ./classes -cp libs/asm-debug-all-4.0_RC2.jar -x "ExInvalid|test" ./classes
