package appendix;

import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.ToggleButton;
import javafx.scene.layout.FlowPane;
import javafx.stage.Stage;

public class ToggleButtonDemo extends Application {
    ToggleButton tBtnOnOff;
    Label response;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        //Child Node
        response = new Label("Push the Button.");

        tBtnOnOff = new ToggleButton("On/Off");
        tBtnOnOff.setOnAction(event -> {
            if (tBtnOnOff.isSelected())
                response.setText("Button is on.");
            else
                response.setText("Button is off.");
        });

        //Parent
        var rootNode = new FlowPane(10, 10);
        rootNode.setAlignment(Pos.CENTER);
        rootNode.getChildren().addAll(tBtnOnOff, response);

        //Scene
        var scene = new Scene(rootNode, 220, 120);

        //Stage
        primaryStage.setScene(scene);
        primaryStage.setTitle("Demonstrate a Toggle Button");
        primaryStage.show();
    }
}