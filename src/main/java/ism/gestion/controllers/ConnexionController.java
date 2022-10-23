package ism.gestion.controllers;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import ism.gestion.App;
import ism.gestion.core.Fabrique;
import ism.gestion.entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

public class ConnexionController implements Initializable{

    @FXML
    private Text lblErrors;

    @FXML
    private TextField txtLogin;

    @FXML
    PasswordField txtPassword;

    @FXML
    void handleConnexion(ActionEvent event) throws IOException {
        String login=txtLogin.getText().trim();
        String password=txtPassword.getText().trim();

        User user=Fabrique.getService().connexion(login, password);
        if (user==null) {
            lblErrors.setVisible(true);
        }else{
            lblErrors.setVisible(false);
            App.setRoot("home");
        }

    }

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        // TODO Auto-generated method stub
        lblErrors.setVisible(false);
    }

}
