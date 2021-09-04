In order to deploy a JavaFX application using OWS:

Build -> Build Project
open the terminal in webapp folder and type run.bat

The batch file will

1. package the JavaFX application in a jar

2. gather platform (OS) specific jars from the OpenJFX libraries.

3. signed all jars with required security attributes in their manifests.

4. deploy all jars in a server

5. run the project

6. open Jnlp file.