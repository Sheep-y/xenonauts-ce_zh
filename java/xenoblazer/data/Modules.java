package xenoblazer.data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

public class Modules {
   public List<String> all = new ArrayList<>( 40 );
   public Set<String> active = new HashSet<>( 16 );

   public CompletableFuture<Modules> load() {
      final CompletableFuture<Modules> task = new CompletableFuture<>();
      ForkJoinPool.commonPool().execute( () -> { try {

         Process process = Runtime.getRuntime().exec( "reg query \"HKCU\\Software\\Goldhawk Interactive\\Xenonauts\" /v XceModOrder" );
         process.waitFor( 30, TimeUnit.SECONDS );
         if ( task.isCancelled() ) return;
         String[] order = parse( process.getInputStream() );

         process = Runtime.getRuntime().exec( "reg query \"HKCU\\Software\\Goldhawk Interactive\\Xenonauts\" /v XceActiveMods" );
         process.waitFor( 30, TimeUnit.SECONDS );
         if ( task.isCancelled() ) return;
         String[] enabled = parse( process.getInputStream() );

         synchronized ( this ) {
            all.clear();
            for ( String mod : order   ) all.add( mod );
            active.clear();
            for ( String mod : enabled ) active.add( mod );
         }

         task.complete( this );

      } catch ( Exception ex ) {
         task.completeExceptionally( ex );
      }});
      return task;
   }

   private String[] parse( InputStream stream ) {
      return parse( new BufferedReader( new InputStreamReader( stream) ).lines().collect( Collectors.joining( "\n" ) ) );
   }

   private String[] parse( String psv ) {
      // No need to handle pipe in name, because it is invalid folder name and thus invalid module id
      String[] list = psv.split( "\n" )[2].split( "\\s+", 4 )[3].split( "\\|" );
      return Arrays.copyOfRange( list, 1, list.length-1 );
   }
}
