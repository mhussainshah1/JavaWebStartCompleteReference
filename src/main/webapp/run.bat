:: run
:: start java web start application
javaws ToggleButtonDemo.jnlp

::Test
::run ToggleButtonDemo file
::java --module-path jars --add-modules javafx.controls,javafx.fxml appendix.ToggleButtonDemo

::run ToggleButtonDemo.jar file
::java --module-path jars --add-modules javafx.controls,javafx.fxml -jar jars\ToggleButtonDemo.jar