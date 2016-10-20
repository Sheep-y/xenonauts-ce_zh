import java.awt.GraphicsEnvironment;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.swing.JOptionPane;

/** This program reads XML files and builds glyph list for Playmate Font Maker */
public class Main {

   private static final String TITLE = "Glyph list generator for Playmate Font Maker / Xenonauts translation";
   private static final String OUTPUT = "xenonauts.txt";

   public static void main( String[] args ) {
      alert( TITLE + ".\nThis program reads UTF-8 xml files from the xml folder and create a list of unique unicode characters." );
      int file_count = 0;
      List<String> lines = new ArrayList<>( 2000 );

      // Read files
      File[] files = new File( "xml" ).listFiles( f -> f.isFile() && f.getName().endsWith( ".xml" ) );
      if ( files == null ) {
         alert( "No files found in xml folder.", JOptionPane.ERROR_MESSAGE );
         return;
      }
      for ( File f : files ) {
         try {
             Files.lines( f.toPath() ).forEach( line -> lines.add( line ) );
            ++file_count;
         } catch (IOException ex) {
            alert( "Cannot read " + f + ": " + ex.getMessage(), JOptionPane.ERROR_MESSAGE );
         }
      }

      String output =
      // Trim and filter out empty lines
         lines.stream().parallel().map( line -> line.trim() ).filter( line -> ! line.isEmpty() )
      // Collect distinct glyphs (parallel)
         .collect( () -> new HashSet<Integer>(),
            ( list, line ) -> line.codePoints().forEach( list::add ),
            Set::addAll )
      // Convert to string for output (non-parallel)
         .stream().sorted().collect( StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append )
         .toString().trim();

      if ( output.isEmpty() ) {
         alert( "Nothing to output.", JOptionPane.WARNING_MESSAGE );
      } else {
         try {
            Files.write( new File( OUTPUT ).toPath(), output.getBytes( StandardCharsets.UTF_8 ) );
            alert( "Written to " + OUTPUT + ". Processed " + file_count + " files for " + output.length() + " characters." );
         } catch ( IOException ex ) {
            alert( "Cannot write " + OUTPUT + ": " + ex.getMessage(), JOptionPane.ERROR_MESSAGE );
         }
      }
   }

   private static void alert( String msg ) {
      alert( msg, JOptionPane.INFORMATION_MESSAGE );
   }

   private static void alert( String msg, int type ) {
      if ( GraphicsEnvironment.isHeadless() ) {
         System.out.println( msg );
      } else {
         JOptionPane.showMessageDialog( null, msg, "Glyph Lister", type );
      }
   }

}
