:: build
:: 2) gather platform (OS) specific jars from the OpenJFX libraries.
curl.exe --output jars\javafx-controls-19-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-controls/19/javafx-controls-19-win.jar
curl.exe --output jars\javafx-base-19-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-base/19/javafx-base-19-win.jar
curl.exe --output jars\javafx-fxml-19-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/19/javafx-fxml-19-win.jar
curl.exe --output jars\javafx-graphics-19-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/19/javafx-graphics-19-win.jar

:: 1) package the JavaFX application in a jar
:: compile
javac --module-path jars --add-modules javafx.controls,javafx.fxml appendix\ToggleButtonDemo.java

:: create jar file
jar cfm jars\ToggleButtonDemo.jar MyMan.txt appendix\*.class

:: 3)all jars must be signed and must have required security attributes in their manifests.
:: create certificate - password is test123
keytool -genkeypair -keyalg DSA -alias devName -keystore devKeys

:: sign jar file
jarsigner -keystore devKeys jars\javafx-base-19-win.jar devName
jarsigner -keystore devKeys jars\javafx-controls-19-win.jar devName
jarsigner -keystore devKeys jars\javafx-graphics-19-win.jar devName
jarsigner -keystore devKeys jars\javafx-fxml-19-win.jar devName

:: sign project jar file
jarsigner -keystore devKeys jars\ToggleButtonDemo.jar devName