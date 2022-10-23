package ism.gestion.controllers;

import java.util.ArrayList;
import java.util.List;

import ism.gestion.core.Fabrique;
import ism.gestion.entities.Classe;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class EtudiantController {

    @FXML
    private ComboBox<?> cbAnnee;

    @FXML
    private ComboBox<?> cbClasse;

    @FXML
    private TableColumn<?, ?> tblcId;

    @FXML
    private TableColumn<?, ?> tblcMatricule;

    @FXML
    private TableColumn<?, ?> tblcNomComplet;

    @FXML
    private TableColumn<?, ?> tblcTuteur;

    @FXML
    private TableView<?> tblvEtudiant;
    public List<String> genererAnnee(){
        List<String> annees=new ArrayList<>();
        for (int i = 1992; i <=2050; i++) {
            annees.add(""+i);
        }
        return annees;
    }

    public List<String> genererClasse(){
        List<String> classes=new ArrayList<>();
        Fabrique.RPService().listerClasse().forEach(cl->classes.add(cl.getLibelle()));
        return classes;
    }
   
    ObservableList etudiants=FXCollections.observableList(Fabrique.ACService().listerEtudiants());
    ObservableList<String> classes=FXCollections.observableArrayList(genererClasse());
    ObservableList<String> annees=FXCollections.observableList(genererAnnee());


    @FXML
    public void handleFiltrerEtudiantsParAnnee() {
        String annee=cbAnnee.getSelectionModel().getSelectedItem().toString();
        ObservableList etudiantsParAnnee=FXCollections.observableList(Fabrique.ACService().listerEtudiantInscritAnnee(annee));
        handleListerEtudiant(etudiantsParAnnee);

    }

    @FXML
    public void handleFiltrerEtudiantsParClasse() {
        String libelle=cbClasse.getSelectionModel().getSelectedItem().toString();
        Classe classe=Fabrique.RPService().findClasseByLibelle(libelle);
        ObservableList etudiantsParClasse=FXCollections.observableList(Fabrique.ACService().filtrerEtudiantInscritParClasse(classe));
        handleListerEtudiant(etudiantsParClasse);
    }


    public void handleListerEtudiant(ObservableList list){
        tblcId.setCellValueFactory(new PropertyValueFactory<>("id"));
        tblcMatricule.setCellValueFactory(new PropertyValueFactory<>("matricule"));
        tblcNomComplet.setCellValueFactory(new PropertyValueFactory<>("nomComplet"));
        tblcTuteur.setCellValueFactory(new PropertyValueFactory<>("tuteur"));
        tblvEtudiant.setItems(list);
    }
    @FXML
    public void handleInscrireEtudiant(ActionEvent event) {

    }

    @FXML
    void handleReinscription(ActionEvent event) {

    }

}
