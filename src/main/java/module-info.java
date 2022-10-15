module JavaWebStartCompleteReference {
    requires javafx.controls;
    requires javafx.fxml;

    opens appendix to javafx.fxml;
    exports appendix;
}