:: WINDOWS 10 commands

:: delete certificate class and jar files
del devKeys
del jars\*.jar

:: 2) gather platform (OS) specific jars from the OpenJFX libraries.
curl.exe --output jars\javafx-base-16-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-base/16/javafx-base-16-win.jar
curl.exe --output jars\javafx-controls-16-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-controls/16/javafx-controls-16-win.jar
curl.exe --output jars\javafx-fxml-16-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/16/javafx-fxml-16-win.jar
curl.exe --output jars\javafx-graphics-16-win.jar --url https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/16/javafx-graphics-16-win.jar

:: 1) package the JavaFX application in a jar
:: compile
::javac --module-path jars --add-modules javafx.controls, javafx.fxml ..\java\appendix\ToggleButtonDemo.java

:: create jar file
jar cfm jars\ToggleButtonDemo.jar MyMan.txt appendix\*.class

:: 3)all jars must be signed and must have required security attributes in their manifests.
:: create certificate - password is test123
keytool -genkeypair -keyalg DSA -alias devName -keystore devKeys

:: sign jar file
jarsigner -keystore devKeys jars\javafx-base-16-win.jar devName
jarsigner -keystore devKeys jars\javafx-controls-16-win.jar devName
jarsigner -keystore devKeys jars\javafx-fxml-16-win.jar devName
jarsigner -keystore devKeys jars\javafx-graphics-16-win.jar devName

:: sign project jar file
jarsigner -keystore devKeys jars\ToggleButtonDemo.jar devName

:: start java web start application
::javaws ToggleButtonDemo.jnlp

::Test
::run ToggleButtonDemo file
::java --module-path jars --add-modules javafx.controls,javafx.fxml appendix.ToggleButtonDemo

::run ToggleButtonDemo.jar file
::java --module-path jars --add-modules javafx.controls,javafx.fxml -jar jars\ToggleButtonDemo.jar