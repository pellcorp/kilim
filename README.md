# Kilim
Lightweight local/distributed concurrency for Java by message passing

Version v0.7 -- Copyright (c) 2006 Sriram Srinivasan <kilim@malhar.net>

## Overview

This software is released under an MIT-style licesne (please see the License
file). Please see docs/manual.txt and docs/kilim_ecoop08.pdf for a brief
introduction.

Please use GitHub to report bugs (or better yet submit pull requests).
Social Coding, FTW!

## Building

Use Maven to build, test and install Kilim.

### Compile

To compile the source into a jar file simply:

``bash
mvn compile
```

### Test

To exercise the test suite simply:

```bash
mvn test
```

### Examples

To run an example:

```bash
java -cp ./classes:$CLASSPATH kilim.examples.Chain 10
```

### Dependencies

#### ASM 4.0_RC2

This software depends on the ASM bytecode library (v 4.0). 

If you don't have ASM version 4.0_RC2 installed in your ~/.m2 directory you'll
want to install it.  There is a copy in the `libs` directory, to install it
simply do the following:

```bash
mvn install:install-file -Dfile=libs/asm-debug-all-4.0_RC2.jar -DgroupId=asm -DartifactId=asm-all -Dversion=4.0_RC2 -Dpackaging=jar
```

After which you'll see Maven do some magic resulting in the following:

```bash
/home/you/.m2/repository/asm/asm-all/4.0_RC2/asm-all-4.0_RC2.jar
/home/you/.m2/repository/asm/asm-all/4.0_RC2/asm-all-4.0_RC2.jar.lastUpdated
/home/you/.m2/repository/asm/asm-all/4.0_RC2/asm-all-4.0_RC2.pom
/home/you/.m2/repository/asm/asm-all/4.0_RC2/asm-all-4.0_RC2.pom.lastUpdated
```

#### Java 7 (1.7.x)

This library has been ported to Java 7.  It's now "Write once, run on JDK7 only."
