<html>
<!----------------------------------------------------------------------
Archive: 		OEISBibTeX.php
Description: 	Searches OEIS Wiki and displays the BibTeX citation.
Date: 			14/Feb/2010
Version:		1
Link:	        http://www.oeis2bibtex.netai.net/OEIS2BibTeX.php
Author:		    Enrique Pérez Herrero
Blogger:        http://psychedelic-geometry.blogspot.com
----------------------------------------------------------------------->

<head>
<title>OEIS2BibTeX</title>
</head>

<body bgcolor="#FF9933">
<code>

<b><font face="Franklin Gothic Medium" size="7">

OEIS2BibTeX&nbsp;</font></b>
<font face="Franklin Gothic Medium" size="2"> Powered by
</font><b><font size="2" face="Tahoma"><a
href="http://psychedelic-geometry.blogspot.com/2010/02/bibtex-automatic-oeis-citations.html">
PSYCHEDELIC GEOMETRY</a> </font></b><font face="Franklin Gothic Medium"
size="2">Blogspot.</font> <hr>


</code>


<font face="Franklin Gothic Medium">


Copy and paste to your <b>&quot;*.bib&quot;</b> archive:</font>
<code>

<p style="background-color: #FFFFCC">


<?php

//Classic OEIS url.
$oeis_url = "https://oeis.org/";
//$oeis_url = "http://www.research.att.com/~njas/sequences/";

//Wiki OEIS url.
$wiki_oeis_url = "http://oeis.org/wiki/";

function validate_sequence($s)
	{
   if (strlen($s) != 7)
   		{
   		print("ERROR-1: Bad length!");
      	return false;
   		}
   $permitted = "0123456789";
   for ($i = 1; $i < strlen($s); $i++)
   		{
      	if (strpos($permitted, substr($s, $i, 1)) === false)
      		{
      		print("ERROR-2: Wrong characters on input string!");
         	return false;
      		}
   		}
   	if (strpos("A", substr($s, 0, 1)) === false)
      		{
      		print("ERROR-3: The Sequence does not begin with A.");
         	return false;
      		}
   return true;
}


$OEIS_Id=strtoupper($_POST["sequence"]);

if(validate_sequence($OEIS_Id))
{
	$url1 = $oeis_url.$OEIS_Id;
	$url2 = $wiki_oeis_url.$OEIS_Id;

	//echo "$url1"."<br/>";
	//echo "$url2"."<br/>";

	$page_url = fopen($url2, "r");
	if($page_url)
	{
		$OEIS_Text="";
	    while(!feof($page_url))
	    {
			$OEIS_Text .= fgetss($page_url, 1024);
		}
		//echo $OEIS_Text."<br/>"."<br/>";
		// Search the sequence description.

		$d1 = strpos($OEIS_Text, ", search");
		$d2 = strpos($OEIS_Text, "classic");
		$OEIS_Description = substr($OEIS_Text, $d1 +
		strlen(", search"), $d2 - $d1 - strlen("classic")-1);

		// Search the sequence Author.
		$a1 = strrpos($OEIS_Text, "Author");
		$a2 = strrpos($OEIS_Text, "Retrieved");
		$OEIS_Author=substr($OEIS_Text, $a1 + strlen("Author"), $a2 -
		$a1 - strlen("Retrieved")-1);

   		//Removing Author's email.
   		$e = strpos($OEIS_Author, "(");
   		$OEIS_Author=substr($OEIS_Author, 1, $e - 2);


  		echo "@MISC{oeis".$OEIS_Id.",<br/>".
  		"AUTHOR = {".$OEIS_Author."},<br/>".
  		"TITLE = {The {O}n-{L}ine {E}ncyclopedia of {I}nteger {S}equences},<br/>".
  		"HOWPUBLISHED = {\href{".$url2."}{".$OEIS_Id."}},<br/>".
  		"MONTH = {},<br/>".
  		"YEAR = {},<br/>".
  		"NOTE = {".$OEIS_Description."}<br/>}";
		}
	}
fclose($page_url);
?>

</code>
</p>


</body>
</html>
