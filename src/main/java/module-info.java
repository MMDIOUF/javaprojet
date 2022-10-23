module ism.gestion {
    requires javafx.controls;
    requires javafx.fxml;
    requires mysql.connector.java;
    requires java.sql;

    opens  ism.gestion.controllers to javafx.fxml;
    exports ism.gestion;
    exports ism.gestion.entities;
    exports ism.gestion.controllers;
}

