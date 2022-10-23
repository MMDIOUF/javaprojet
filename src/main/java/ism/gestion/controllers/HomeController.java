package ism.gestion.controllers;


import java.io.IOException;

import ism.gestion.App;

import javafx.fxml.FXML;
import javafx.scene.layout.AnchorPane;

public class HomeController {

    @FXML
    private AnchorPane anchorContent;

    @FXML
    void handleDeconnexion() throws IOException {
        App.setRoot("connexion");
    }
    
    public void handleLoadViewClasse() throws IOException{
        this.loadView("classe");
    }
    
    public void handleLoadViewProfesseur() throws IOException {
        this.loadView("professeur");
    }
    public void handleLoadViewEtudiant() throws IOException {
        this.loadView("etudiant");
    }

   
    void loadView(String fxml) throws IOException{
        AnchorPane root= (AnchorPane) App.loadFXML(fxml);
        anchorContent.getChildren().clear();
        anchorContent.getChildren().add(root);
    }

}
