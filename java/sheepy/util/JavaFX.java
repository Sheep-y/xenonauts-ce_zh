package sheepy.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Platform;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Control;
import javafx.scene.control.DialogPane;
import javafx.scene.control.TextInputControl;
import javafx.scene.control.Tooltip;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.VBox;
import javafx.util.Duration;

public class JavaFX {

   /////////////////////////////////////////////////////////////////////////////
   // Layout helpers
   /////////////////////////////////////////////////////////////////////////////

   /**
    * Create a HBox with nodes that expand to equal size.
    *
    * @param spacing Node spacing
    * @param nodes Nodes to layout
    * @return HBox with equal size nodes
    */
   public static HBox fitHBox ( double spacing, Node ... nodes ) {
      HBox box = new HBox( spacing, nodes );
      for ( Node n : nodes ) {
         HBox.setHgrow( n, Priority.SOMETIMES );
         if ( n instanceof Region ) maxSize( (Region) n );
      }
      return box;
   }
   public static HBox fitHBox ( Node ... nodes ) {
      return fitHBox( 0, nodes );
   }

   /**
    * Create a VBox with nodes that expand to equal size.
    *
    * @param spacing Node spacing
    * @param nodes Nodes to layout
    * @return VBox with equal size nodes
    */
   public static VBox fitVBox ( double spacing, Node ... nodes ) {
      VBox box = new VBox( spacing, nodes );
      for ( Node n : nodes ) {
         VBox.setVgrow( n, Priority.SOMETIMES );
         if ( n instanceof Region ) maxSize( (Region) n );
      }
      return box;
   }
   public static VBox fitVBox ( Node ... nodes ) {
      return fitVBox( 0, nodes );
   }

   public static <T extends Region> T maxWidth ( T region ) {
      region.setMaxWidth( Double.MAX_VALUE );
      return region;
   }

   public static <T extends Region> T maxHeight ( T region ) {
      region.setMaxHeight( Double.MAX_VALUE );
      return region;
   }

   public static <T extends Region> T maxSize ( T region ) {
      region.setMaxHeight( Double.MAX_VALUE );
      region.setMaxWidth( Double.MAX_VALUE );
      return region;
   }

   /////////////////////////////////////////////////////////////////////////////
   // Builders
   /////////////////////////////////////////////////////////////////////////////

   public static <T extends Control> T tooltip( T control, String tooltip ) {
      control.setTooltip( new Tooltip( tooltip ) );
      return control;
   }

   /** Set a dialog's default button and return the dialog */
   public static Alert dialogDefault ( Alert alert, ButtonType defBtn ) {
      DialogPane pane = alert.getDialogPane();
      for ( ButtonType t : alert.getButtonTypes() )
         ( (Button) pane.lookupButton(t) ).setDefaultButton( t == defBtn );
      return alert;
   }

   /////////////////////////////////////////////////////////////////////////////
   // Execution helpers
   /////////////////////////////////////////////////////////////////////////////

   /**
    * Run a job on FX thread and wait until it finishes
    * @param run Task to run
    */
   public static void runNow( Runnable run ) {
      if ( Platform.isFxApplicationThread() ) {
         run.run();
         return;
      }
      Object sync = new Object();
      Platform.runLater( () -> {
         try {
            run.run();
         } finally { synchronized( sync ) {
            sync.notify();
         } }
      } );
      try { synchronized( sync ) {
         sync.wait();
      } } catch ( InterruptedException ignored ) {}
   }

   /**
    * Defer a task so that it will not be fired more than once per specified millisecond.
    * This method is thread safe.  The task is always executed on JavaFX thread.
    *
    * @param task Task to run.  If use lambda, do NOT refer out of scope values.
    * @param minMilliSecond millisecond Minimal ms between execution.
    */
   public static void runSlow ( Runnable task, int minMilliSecond ) {
      synchronized ( deferredTask ) {
         if ( deferredTask.contains( task ) )
            return; // Will run soon
         deferredTask.add( task );
      }
      new Timeline( new KeyFrame( Duration.millis( minMilliSecond ), ( v ) -> {
         synchronized( deferredTask ) {
            deferredTask.remove( task );
         }
         if ( Platform.isFxApplicationThread() )
            task.run();
         else
            Platform.runLater( task );
      } ) ).play();
   }
   private static final Set<Runnable> deferredTask = new HashSet<>();

   public static void runSlow ( Runnable task ) {
      runSlow( task, 333 );
   }

   /**
    * Buffer and append text to a text input at a throttled rate.
    * This method is thread safe.
    *
    * @param component Component to add text
    * @param msg Text to add
    */
   public static void appendText( TextInputControl component, CharSequence msg ) {
      synchronized ( appendCache ) {
         StringBuilder str = appendCache.get( component );
         if ( str != null ) {
            str.append( msg );
         } else {
            if ( appendCache.isEmpty() )
               runSlow( JavaFX::appendTextRun );
            appendCache.put( component, new StringBuilder( msg ) );
         }
      }
   }
   private static final Map<TextInputControl, StringBuilder> appendCache = new HashMap<>();
   private static void appendTextRun () {
      // Copy buffered text then release its lock
      Map<TextInputControl, StringBuilder> cached;
      synchronized ( appendCache ) {
         cached = new HashMap( appendCache );
         appendCache.clear();
      }
      // And update text inputs at our leisure.
      cached.entrySet().forEach( e -> {
         final TextInputControl control = e.getKey();
         control.insertText( control.getLength(), e.getValue().toString() );
      });
      cached.clear();
   }
}