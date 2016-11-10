package xenoblazer.ui;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.prefs.Preferences;
import javafx.application.Platform;
import javafx.geometry.Pos;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.TextArea;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import sheepy.util.Utils;
import xenoblazer.App;
import xenoblazer.Main;
import xenoblazer.data.Data;

public class SceneMain extends Scene {

   private static final Logger log = Main.log;
   private static final Preferences prefs = Main.prefs;

   private final TextArea txtLog = new TextArea();

   private final Label lblLoading = new Label();
   private final ProgressBar pgrLoading = new ProgressBar();

   private final Pane pnlC = new BorderPane();
   private final VBox pnlPop = new VBox( lblLoading, pgrLoading );

   private final StackPane pnlStack = new StackPane( pnlC, pnlPop );

   public SceneMain( App main ) {
      super( new Group(), 800, 500 );
      main.addLoggerOutput( txtLog );
      initControls();
      initLayout();
      setRoot( pnlStack );
   }

   private void initControls () {
      pnlPop.setVisible( false );
      pnlPop.setAlignment( Pos.CENTER );
      lblLoading.setStyle( "-fx-font-size:40;" );
      pgrLoading.setPrefWidth( 400 );
   }

   private void initLayout () {

   }

   public void startup () {
      loading( "Loading modules" );
      Data.modules.load().whenComplete( ( modules, error ) -> { Platform.runLater( () -> {
         loaded();
         if ( error != null ) {
            // Error
            final String msg = "Cannot load Xenonaut module settings";
            log.log( Level.WARNING, "{0}: {1}" , new Object[]{ msg, Utils.stacktrace( error ) } );
            Alert alert = new Alert( Alert.AlertType.ERROR, msg + "." );
            alert.show();
         }
      }); });
   }

   public void shutdown () {

   }

   /** Loading **/
   void loading( String message ) {
      loading( message, 0.0 );
   }

   void loading( String message, double progress ) {
      lblLoading.setText( message );
      pgrLoading.setProgress( progress );
      pnlPop.setVisible( true );
   }

   void loaded() {
      pnlPop.setVisible( false );
   }
}
