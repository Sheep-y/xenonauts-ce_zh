import java.awt.FileDialog;
import java.awt.GraphicsEnvironment;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.stream.Stream;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * This program reads XML files and builds glyph list for Playmate Font Maker
 */
public class Main {

   private static final String TITLE = "Glyph list generator for Playmate Font Maker / Xenonauts translation";
   private static final String INPUT = "mod_xce_zh";
   private static final String OUTPUT = "Playmate Font Maker/Character Sets/";

   public static void main( String[] args ) {
      new Main().gen();
   }

   public void gen() {
      alert( TITLE + ".\nThis program reads UTF-8 xml files from the "+INPUT+" folder and create a list of unique unicode characters." );

      // Read files
      File[] files = new File( INPUT ).listFiles( f -> f.isFile() && f.getName().endsWith( ".xml" ) );
      if ( files == null ) {
         alert( "No files found in " + INPUT + " folder.", JOptionPane.ERROR_MESSAGE );
         return;
      }

      // Read text content
      String output = Arrays.stream( files ).parallel()
         .map( f -> read( f.toString() ).getDocumentElement().getTextContent() )
         // Split into distinct code points
         .flatMapToInt( text -> text.codePoints() ).parallel().distinct().sorted()
         // Convert to string for output
         .collect( StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append )
         .toString().trim();

      write( output, OUTPUT + "Xenonauts.txt" );
   }



   JFrame frame;

   private void alert( String msg ) {
      alert( msg, JOptionPane.INFORMATION_MESSAGE );
   }

   private void alert( String msg, int type ) {
      if ( GraphicsEnvironment.isHeadless() ) {
         System.out.println( msg );
      } else {
         if ( frame == null ) frame = new JFrame( "Main Hidden Window" );
         JOptionPane.showMessageDialog( frame, msg, "Glyph Lister", type );
      }
   }

   public void sfd() {
      alert( TITLE + ".\nThis program reads sfd (FontForge) file and output glyph list for font maker." );
      FileDialog dlgOpen = new FileDialog( frame, "Select sfd file ", FileDialog.LOAD );
      dlgOpen.setFilenameFilter( ( dir, name ) -> name.endsWith( ".sfd" ) );
      dlgOpen.setMultipleMode( true );
      dlgOpen.setVisible( true );

      // Read into lines
      String output = Arrays.stream( dlgOpen.getFiles() )
         .flatMap( this::readLineStream ).parallel()
         // Map to glyph code
         .filter( line -> line.startsWith( "Encoding: " ) )
         .mapToInt( line -> { try {
               return Integer.parseInt( line.substring( 10 ).split( " " )[0] );
            } catch ( NumberFormatException ex ) { return 32; } } )
         .filter( codepoint -> codepoint < 65535 ).distinct()
         // Convert to string for output
         .collect( StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append )
         .toString().trim();

      write( output, OUTPUT + "All Glyphs.txt" );
   }

   private Stream<String> readLineStream ( File file ) {
      try {
         return Files.readAllLines( file.toPath() ).stream();
      } catch ( IOException ex ) {
         throw new RuntimeException( ex );
      }
   }

   private Document read ( String file ) {
      try {
         return DocumentBuilderFactory.newInstance().newDocumentBuilder().parse( new File( file ) );
      } catch ( IOException | SAXException | ParserConfigurationException ex ) {
         throw new RuntimeException( ex );
      }
   }


   private void write ( String output, String file ) {
      if ( output.isEmpty() ) {
         alert( "Nothing to output.", JOptionPane.WARNING_MESSAGE );
      } else {
         try {
            Files.write( new File( file ).toPath(), output.getBytes( StandardCharsets.UTF_8 ) );
            alert( "Written to '" + file + "'. Total " + output.length() + " characters." );
         } catch ( IOException ex ) {
            alert( "Cannot write '" + file + "': " + ex.getMessage(), JOptionPane.ERROR_MESSAGE );
         }
      }
      frame.dispose();
   }

   private void write ( Document doc, String file ) {
      try ( OutputStream out = Files.newOutputStream( new File( file ).toPath() ) ) {
         TransformerFactory.newInstance().newTransformer().transform( new DOMSource( doc ), new StreamResult( out ) );
      }  catch ( IOException | TransformerException ex) {
         throw new RuntimeException( ex );
      }
   }

   private void out ( Document doc, String file ) {
      try {
         TransformerFactory.newInstance().newTransformer().transform( new DOMSource( doc ), new StreamResult( System.out ) );
      }  catch ( TransformerException ex) {
         throw new RuntimeException( ex );
      }
   }

   private Element e ( Node element ) {
      return (Element) element;
   }

   private Element[] e ( Element root, String tagName ) {
      NodeList list = root.getElementsByTagName( tagName );
      Element[] result = new Element[ list.getLength() ];
      for ( int i = 0, len = list.getLength() ; i < len ; i++ )
         result[i] = e( list.item( i ) );
      return result;
   }

   private Element e ( Node root, String tagName, int index ) {
      return e( ( (Element) root ).getElementsByTagName( tagName ).item( index ) );
   }

   private boolean validRow ( Element row, int data_index ) {
      Element[] data = e( row, "Data" );
      if ( data.length <= data_index ) return false;
      if ( data[0].getTextContent().isEmpty() ) return false;
      if ( data[data_index].getTextContent().length() < 3 ) return false;
      return true;
   }

   private Element cloneRow ( Element row ) throws DOMException {
      Element newRow = e( row.cloneNode( true ) );
      Element[] newData = e( newRow, "Data" );
      // Delete all data but keep id
      for ( Element data : newData ) data.setTextContent( "" );
      newData[0].setTextContent( e( row, "Data", 0 ).getTextContent() );
      return newRow;
   }

   private void dec() {
      //dec( INPUT + "/strings.xml", 1 );
      dec( INPUT + "/xenopedia.xml", 5 );
   }

   private void dec( String file, int data_index ) {
      StringBuilder enc = new StringBuilder( 4096 );
      Map<String, String> map = new HashMap<>();

      Document doc = read( file );
      int processed = 0;
      for ( Element row : e( doc.getDocumentElement(), "Row" ) ) {
         if ( ! validRow( row, data_index ) ) continue;
         String text = e( row, "Data", data_index ).getTextContent();
         if ( ! text.contains( "MODMERGEREPLACE: " ) ) continue;
         processed++;

         for ( String part : text.split( " ?MODMERGEREPLACE: " ) ) {
            if ( part.isEmpty() ) continue;
            String[] tokens = part.split( " MODMERGEWITH: " );
            map.put( tokens[0], tokens[1] );
         }
         for ( String key : getCode( map ).split( "" ) )
            if ( map.containsKey( key ) )
               enc.append( map.get( key ) );
         e( row.getPreviousSibling(), "Data", data_index ).setTextContent( enc.toString() );

         map.clear();
         enc.setLength( 0 );
         row.getParentNode().removeChild( row );
      }
      System.out.println( "Processed " + processed + " rows in " + file );
      if ( processed > 0 ) write( doc, file );
   }

   private void enc() {
      //enc( INPUT + "/strings.xml", 1 );
      dec( INPUT + "/xenopedia.xml", 5 );
      enc( INPUT + "/xenopedia.xml", 5 );
   }

   private void enc( String file, int data_index ) {
      StringBuilder enc = new StringBuilder( 4096 );
      SortedMap<String, String> map = new TreeMap<>( ( a, b ) -> b.compareTo( a ) );

      Document doc = read( file );
      int processed = 0;
      for ( Element row : e( doc.getDocumentElement(), "Row" ) ) {
         if ( ! validRow( row, data_index ) ) continue;
         if ( processed++ == 0 ) continue;

         Element newRow = cloneRow( row );
         Element cell = e( row, "Data", data_index );
         String text = cell.getTextContent();
         String code = getCode( text );
         if ( code.length() > text.length() ) code = code.substring( 0, text.length() );
         int token_size = Math.max( 1, (int) Math.floor( text.length() / code.length() ) );
         cell.setTextContent( "<font size='24'>" + code );

         for ( int i = 0 ; i < code.length() ; i++ )
            map.put( text.substring( i*token_size, i == code.length()-1 ? text.length() : (i+1)*token_size ), code.substring( i, i+1 ) );
         for ( Map.Entry<String, String> e : map.entrySet() )
            enc.append( "MODMERGEREPLACE: " ).append( e.getValue() ).append( " MODMERGEWITH: " ).append( e.getKey() ).append( ' ' );

         enc.setLength( enc.length() - 1 );
         e( newRow, "Data", data_index ).setTextContent( enc.toString() );

         map.clear();
         enc.setLength( 0 );
         row.getParentNode().insertBefore( newRow, row.getNextSibling() );
      }
      System.out.println( "Processed " + processed + " rows in " + file );
      write( doc, file );
   }

   private static final String[] codes = new String[]{ "\u5e72\u4e7e\u5e79\u69a6\u8499\u61de\u6fdb\u77c7", "\u5c40\u4fb7\u6336\u8dfc\u96d5\u9d70\u5f6b\u7431", "\u81fa\u53f0\u6aaf\u98b1\u5e76\u4e26\u4f75" };
   private static MessageDigest md;
   static {
      try {
         md = MessageDigest.getInstance( "SHA-1" );
         /**for ( String code : codes ) {
            for ( int i = 0 ; i < code.length() ; i++ ) System.out.print( "\\u" + Integer.toHexString( code.codePointAt( i ) ) );
            System.out.println(); }/**/
      } catch (NoSuchAlgorithmException ex) {
         throw new RuntimeException( ex );
      }
   }


   private String getCode ( String txt ) {
      StringBuilder code = new StringBuilder( codes[ Math.abs( md.digest( txt.getBytes( StandardCharsets.UTF_16 ) )[0] ) % codes.length ] );
      for ( int i = code.length() - 1 ; i >= 0 ; i-- )
         if ( txt.indexOf( code.charAt( i ) ) >= 0 ) {
            code.delete( i, i + 1 );
            continue;
         }
      return code.toString();
   }

   private String getCode( Map<String, String> tokens ) {
      char firstKey = tokens.keySet().iterator().next().charAt( 0 );
      for ( String code : codes )
         if ( code.indexOf( firstKey ) >= 0 )
            return code;
      throw new IllegalArgumentException();
   }
}