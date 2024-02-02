<html>

<head>
<title></title>
</head>

<body>

<p>#!/usr/bin/perl #Programa del directorio de Piuranos #Diario EL TIEMPO #Elaborado por
Manuel Masías #--------------------------- #ENCABEZADO DE LA PAGINA WEB # NO MODIFICAR!!!
#--------------------------- print (&quot;Content-Type: text/html \n\n&quot;); print <<"ENCABEZADO"; Directorio de Piuranos EL TIEMPO Resultados de la búsqueda ENCABEZADO #--------------------------- #------------------------------- #Acceso a los datos transmitidos #------------------------------- read (STDIN,$save_string, $ENV{CONTENT_LENGTH}); @prompts="split(/&amp;/,$save_string);" foreach (@prompts) { ($name,$value)="split(/=/,$_);" $name="~" s/\%(..)/pack("c",hex($1))/ge; $value="~" s/\%(..)/pack("c",hex($1))/ge; } #PROGRAMA PRINCIPAL #------------------ open(IN,"consulta1.txt"); #Extraccion de los campos $linea=";" $linea="~" tr/a-z/A-Z/; @NombreCampo="split(&quot;;&quot;,$linea);" $encontrados="0;" while($linea=")" { $linea="~" tr/a-z/A-Z/; @FLD="split(&quot;;&quot;,$linea);" #---------------------# # criterio de prueba. # #---------------------# $criterio="$value;" $criterio="~" tr/a-z/A-Z/; $i="0;" if ($linea="~" /$criterio/) { foreach(@FLD){ $dato="$_;" if ($linea="~" /""/) {$dato="No se indico" } #AQUI VA LA IMPRESION DE LA TABLA DE RESULTADOS #---------------------------------------------- print <<"TABLA"; TABLA if (($dato ne /""/)) { print " "; print " @NombreCampo[$i] "; print " "; if ((@NombreCampo[$i] eq "EMAIL")) {print "";} print $dato; if ((@NombreCampo[$i] eq "EMAIL")) {print "";} print " "; } print <<"TABLA"; TABLA #---------------------------------------------- $i="$i+1;" } $encontrados="$encontrados+1;" print " " } } print " $encontrados registro(s) cumple(n) la condicion. "; print " "; print "Programado para EL TIEMPO por 1998"; close (IN);></p>
</body>
</html>
