package xenoblazer;

import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import java.util.prefs.BackingStoreException;
import java.util.prefs.Preferences;
import javafx.application.Application;
import javafx.scene.control.TextInputControl;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import sheepy.util.JavaFX;
import sheepy.util.ResourceUtils;
import sheepy.util.Utils;
import xenoblazer.ui.SceneMain;

public class App extends Application {

   private static final Logger log = Main.log;
   private static final Preferences prefs = Main.prefs;

   /**
    * Launch the app. Required to make MainApp the most recent class on stack,
    * because JavaFX will complain if launch is called directly from Main.
    * @param args Command line arguments
    */
   public static void run ( String[] args ) {
      App.launch( args );
   }

   @Override public void start ( Stage stage ) throws Exception {

      final SceneMain sceneMain = new SceneMain( this );
      log.log( Level.CONFIG, "Java {0} on {1} {2}", new Object[]{ System.getProperty( "java.runtime.version" ), System.getProperty("os.name"), System.getProperty("os.arch") });

      stage.setTitle( Main.TITLE );
      stage.setScene( sceneMain );
      try {
         stage.getIcons().add( new Image( ResourceUtils.getStream( "res/icon.png" ) ) );
      } catch ( Exception err ) {
         log.warning( Utils.stacktrace( err ) );
      }
      stage.setOnCloseRequest( e -> { try {
            sceneMain.shutdown();
            prefs.flush();
            for ( Handler handler : log.getHandlers() )
               handler.close();
         } catch ( BackingStoreException ignored ) { } } );
      stage.show();

      log.info( "Main GUI initialised." );
      sceneMain.startup();
   }


   public void addLoggerOutput( TextInputControl textInput ) throws SecurityException {
      // Setup our logger which goes to log tab.
      Handler handler = new Handler() {
         private volatile boolean closed = false;
         @Override public void publish( LogRecord record ) {
            if ( closed ) return;
            String msg = getFormatter().format( record );
            JavaFX.appendText( textInput, msg );
            if ( record.getLevel().intValue() >= Level.WARNING.intValue() )
               System.err.print( msg );
         }
         @Override public void flush() {}
         @Override public void close() throws SecurityException { closed = true; }
      };
      handler.setFormatter( new SimpleFormatter() );
      log.addHandler( handler );
   }

}