Java version update with update alternatives[] .
.   List all available java versions (might require |sudo|)
    |   update-alternatives --list java
.   Switch java version (might require |sudo|)
    |   update-alternatives --config java
    enter |the number| of the required version
.   Redefine |$JAVA_HOME| variable value manually
    |   export JAVA_HOME='usr/lib/jvm/java-8-oracle'