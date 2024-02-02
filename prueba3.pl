#!/usr/bin/perl

#Programa del directorio de Piuranos
#Diario EL TIEMPO
#Elaborado por Manuel Mas�as
#---------------------------
#ENCABEZADO DE LA PAGINA WEB
#     NO MODIFICAR!!!       
#---------------------------

print ("Content-Type: text/html \n\n");
print <<"ENCABEZADO";

<HTML><HEAD>
<TITLE>Buscador Universal - 1998</TITLE>
</HEAD>
<BODY>
<table border="0" width="100%">
  <tr>
    <td valign="middle"><strong><font color="#800000" size="5" face="Comic Sans MS">Directorio
    de Piuranos<br>
    </font><font color="#800000" face="Comic Sans MS" size="2"></font></strong></td>
    <td align="right" valign="top"><font face="Times New Roman"><strong><font size="7">E</font><font
    size="6">L </font><font size="7">T</font><font size="6">IEMPO</font></strong></font></td>
  </tr>
</table>
<p><font face="Arial"><strong>Resultados de la b�squeda</strong></font></p>
<hr>
ENCABEZADO


#---------------------------

#-------------------------------
#Acceso a los datos transmitidos
#-------------------------------
read (STDIN,$save_string, $ENV{CONTENT_LENGTH});
@prompts=split(/&/,$save_string);
foreach (@prompts) {
($name,$value)=split(/=/,$_);
$name=~ s/\%(..)/pack("c",hex($1))/ge;
$value=~ s/\%(..)/pack("c",hex($1))/ge;
}

#PROGRAMA PRINCIPAL
#------------------
open(IN,"piuranos.txt");

#Extraccion de los campos
$linea=<IN>;
$linea=~ tr/a-z/A-Z/;
@NombreCampo=split(";",$linea);
$encontrados=0;
while($linea=<IN>) {
	$linea=~ tr/a-z/A-Z/;
	@FLD=split(";",$linea);
		#---------------------#
		# criterio de prueba. #
		#---------------------#
			$criterio=$value;
			$criterio=~ tr/a-z/A-Z/;
 $i=0;
 if ($linea=~ /$criterio/) {
	foreach(@FLD){
		$dato=$_;
		if ($linea=~ /""/) {$dato="No se indico"}

#AQUI VA LA IMPRESION DE LA TABLA DE RESULTADOS
#----------------------------------------------

print <<"TABLA";

<div align="center">
<table border="0" width="70%" cellspacing="0" cellpadding="2">
TABLA

if (($dato ne /""/)) {
	print "<tr>";
	print "<td width=\"30%\" bgcolor=\"#FFFF80\"><font face=\"Arial\" size=\"-1\">@NombreCampo[$i]</font></td>";
	print "<td width=\"70%\"><font face=\"Arial\" size=\"-1\">";
		if ((@NombreCampo[$i] eq "EMAIL")) {print "<a href=\"mailto:$dato\">";}
	print $dato;
		if ((@NombreCampo[$i] eq "EMAIL")) {print "</a>";}
	print "</font></td></tr>";
}

print <<"TABLA";
</table>
</div>
TABLA

#----------------------------------------------
  		$i=$i+1;
			}
	$encontrados=$encontrados+1;
print "<hr width=\"80%\" align=\"left\" size=\"1\">"
		}
}
print "<font face=\"Arial\"><H3>$encontrados registro(s) cumple(n) la condicion.</H3><BR><BR>";
print "<hr size=\"2\">";
print "<font face=\"Arial\" size=\"-1\" align=\"left\">Programado para EL TIEMPO por <A HREF=\"mailto:aracnido\@correo.udep.edu.pe\">Manuel Mas�as</A> - 1998";

close (IN);
