# ./run.sh
#!/bin/bash
# Script Maven Tomcat run -> stop -> clean
# PROJECT_PATH="/c/Users/Dion/Documents/java/rentalin"

mvn clean -f "c:\Users\Dion\Documents\java\rentalin\pom.xml"

# mvn tomcat7:shutdown -f "$PROJECT_PATH/pom.xml"

# # Pastikan proses background dihentikan
# kill $TOMCAT_PID 2>/dev/null

# mvn clean -f "$PROJECT_PATH/pom.xml"

mvn tomcat7:run