package xenoblazer;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.prefs.Preferences;
import javax.swing.JOptionPane;

/**
 * Planned to be an app to browse Xenonaut files and show all modifications by mod.
 * Not even at a prototype stage, current just read mod list from registry and that is all.
 */
public class Main {

   static {
      // Set log format and disable global logger
      System.setProperty( "java.util.logging.SimpleFormatter.format",  "%1$tT [%4$s] %5$s%6$s%n" );
      Logger.getLogger( "" ).getHandlers()[0].setLevel( Level.OFF );
   }

   static String TITLE = "Xenoblazer";
   static String VERSION = "0.0.1 (development)";

   // Global log ang preference
   public static final Logger log = Logger.getLogger( Main.class.getName() );
   public static final Preferences prefs = Preferences.userNodeForPackage( Main.class );

   // Main method. No need to check java version because min version is compile target.
   public static void main( String[] args ) {
      log.setLevel( Level.CONFIG );
      try {
         Class.forName( "javafx.stage.Stage" ); // OpenJDK does not come with JavaFX by default
         App.run( args );
      } catch  ( ClassNotFoundException ex ) {
         final String ERR = "This app requires JavaFX (or OpenJFX with WebKit) to run.";
         System.out.println( ERR );
         JOptionPane.showMessageDialog( null, ERR, TITLE + " " + VERSION, JOptionPane.ERROR_MESSAGE );
      }
   }

}
