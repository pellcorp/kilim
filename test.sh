echo "Testing Kilim Weaver"
java -cp ./target/classes:./libs/asm-all-2.2.3.jar:./libs/junit.jar junit.textui.TestRunner kilim.test.AllNotWoven

echo "Task, mailbox tests"
java -Dkilim.Scheduler.numThreads=10 -cp ./target/test-classes:./target/classes:./libs/asm-all-2.2.3.jar:./libs/junit.jar junit.textui.TestRunner kilim.test.AllWoven
