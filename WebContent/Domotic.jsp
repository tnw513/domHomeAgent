<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
        <title> Domotic Control </title>
		<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1"/>
        <meta http-equiv="refresh" content="5">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>

<style>

.switch {
	position: relative;
	display: block;
	vertical-align: top;
	width: 100px;
	height: 30px;
	padding: 3px;
	margin:10px;
	background: linear-gradient(to bottom, #eeeeee, #FFFFFF 25px);
	background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF 25px);
	border-radius: 18px;
	box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);
	cursor: pointer;
}
.switch-input {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
}
.switch-label {
	position: relative;
	display: block;
	height: inherit;
	font-size: 10px;
	text-transform: uppercase;
	background: #eceeef;
	border-radius: inherit;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);
}
.switch-label:before, .switch-label:after {
	position: absolute;
	top: 50%;
	margin-top: -.5em;
	line-height: 1;
	-webkit-transition: inherit;
	-moz-transition: inherit;
	-o-transition: inherit;
	transition: inherit;
}
.switch-label:before {
	content: attr(data-off);
	right: 11px;
	color: #aaaaaa;
	text-shadow: 0 1px rgba(255, 255, 255, 0.5);
}
.switch-label:after {
	content: attr(data-on);
	left: 11px;
	color: #FFFFFF;
	text-shadow: 0 1px rgba(0, 0, 0, 0.2);
	opacity: 0;
}
.switch-input:checked ~ .switch-label {
	background: #E1B42B;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);
}
.switch-input:checked ~ .switch-label:before {
	opacity: 0;
}
.switch-input:checked ~ .switch-label:after {
	opacity: 1;
}
.switch-handle {
	position: absolute;
	top: 4px;
	left: 4px;
	width: 28px;
	height: 28px;
	background: linear-gradient(to bottom, #FFFFFF 40%, #f0f0f0);
	background-image: -webkit-linear-gradient(top, #FFFFFF 40%, #f0f0f0);
	border-radius: 100%;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
}
.switch-handle:before {
	content: "";
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -6px 0 0 -6px;
	width: 12px;
	height: 12px;
	background: linear-gradient(to bottom, #eeeeee, #FFFFFF);
	background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF);
	border-radius: 6px;
	box-shadow: inset 0 1px rgba(0, 0, 0, 0.02);
}
.switch-input:checked ~ .switch-handle {
	left: 74px;
	box-shadow: -1px 1px 5px rgba(0, 0, 0, 0.2);
}

/* Switch Flat
==========================*/
.switch-flat {
	padding: 0;
	background: #FFF;
	background-image: none;
}
.switch-flat .switch-label {
	background: #FFF;
	border: solid 2px #eceeef;
	box-shadow: none;
}
.switch-flat .switch-label:after {
	color: #0088cc;
}
.switch-flat .switch-handle {
	top: 6px;
	left: 6px;
	background: #dadada;
	width: 22px;
	height: 22px;
	box-shadow: none;
}
.switch-flat .switch-handle:before {
	background: #eceeef;
}
.switch-flat .switch-input:checked ~ .switch-label {
	background: #FFF;
	border-color: #0088cc;
}
.switch-flat .switch-input:checked ~ .switch-handle {
	left: 72px;
	background: #0088cc;
	box-shadow: none;
}

.myButton {
	background-color: #c62d1f;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:10px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
	position: relative;
	right: -30px;
}
.myButton:hover {
	background-color:#f24437;
}
.myButton:active {
	position: relative;
	top: 1px;
}

/* Transition
============================================================ */
.switch-label, .switch-handle {
	transition: All 0.3s ease;
	-webkit-transition: All 0.3s ease;
	-moz-transition: All 0.3s ease;
	-o-transition: All 0.3s ease;
}
  
</style>
</head>
<body onload="codeAddress();">
             <table class="table1">
                <thead>
                    <tr>
					<th></th>
					<th> GENERALE </th>
					<th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>ALLARME SICUREZZA</th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Sicurezza" onclick = "CambiaSicurezza()"/>
						<span class="switch-label" data-on="On" data-off="Off"></span> <span class="switch-handle"></span> </label> </td>
						<td> <img id = "Security-pic" src="images/unlock.png" width = "80" height = "80">  </td>
                    </tr>
                    <tr>
                        <th> BOX AUTO </th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Garage" onclick = 'ajaxSyncRequest("set-box-auto")'/>
						<span class="switch-label" data-on="Open" data-off="Close"></span> <span class="switch-handle"></span> </label> </td>
                        <td> <img src="images/garage.jpg" width = "50" height = "50">  </td>
                    </tr>
                    
                    <tr>
                        <th> TEMPERATURA CORRENTE </th>
                        <td> <span id="Temperatura-Corrente"></span></td>
                        <td> <img src="images/temp.png" width = "50" height = "50">  </td>
                    </tr>
                    
                    <tr>
                        <th> TEMPERATURA INTERNA <br> AUTOMATICA</th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Temperatura" onclick = "AbilitaTemperatura()" />
						<span class="switch-label" data-on="On" data-off="Off"></span> <span class="switch-handle"></span> </label> 
						
						<select id = "Valore-Temperatura" onclick= 'ajaxSyncRequest("set-temperatura")' disabled>
							<option value = "30"> 30� </option>
							<option value = "29"> 29� </option>
							<option value = "28"> 28� </option>
							<option value = "27"> 27� </option>
							<option value = "26"> 26� </option>
							<option value = "25"> 25� </option>
							<option value = "24"> 24� </option>
							<option value = "23"> 23� </option>
							<option value = "22"> 22� </option>
							<option value = "21"> 21� </option>
							<option value = "20" selected> 20� </option>
							<option value = "19"> 19� </option>
							<option value = "18"> 18� </option>
							<option value = "17"> 17� </option>
							<option value = "16"> 16� </option>
							<option value = "15"> 15� </option>
							<option value = "14"> 14� </option>
							<option value = "13"> 13� </option>
							<option value = "12"> 12� </option>
							<option value = "11"> 11� </option>
							<option value = "10"> 10� </option>
						</select>
						<td> <img src="images/thermo-gif.gif" width = "25" height = "50">  </td>
                    </tr>
                    <tr>
                        <th> ALLARME <br> ANTI-INCENDIO </th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Incendio" onclick = "CambiaIncendio()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label>  </td>
                        <td> <img id = "Fire-pic" src="images/fire-on.png" width = "80" height = "80">  </td>
                    </tr>
                </tbody>
            </table> 
			
			<br> <br>
			
			<table class="table1" style = "margin-top:-550px; margin-left:475px;">
                <thead>
                    <tr>
                        <th></th>
                        <th> SALONE </th>
                        <th> CAMERA DA LETTO </th>
                        <th> BAGNO </th>
                        <th> CUCINA </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>LUCE</th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Luce-Salone" onclick = "SetLuceSalone()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Luce-Camera" onclick = "SetLuceCamera()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Luce-Bagno" onclick = "SetLuceBagno()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Luce-Cucina" onclick = "SetLuceCucina()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label> </td>
						
						
						<td> <img id = "Light-pic" src="images/light-off.png" width = "80" height = "80"> </td>
					</tr>
                    
					<tr>
                        <th> TAPPARELLA</th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Tapparella-Salone" onclick = 'ajaxSyncRequest("set-tapparella-salone")'/>
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Tapparella-Camera" onclick = 'ajaxSyncRequest("set-tapparella-camera")'/>
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Tapparella-Bagno" onclick = 'ajaxSyncRequest("set-tapparella-bagno")'/>
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Tapparella-Cucina" onclick = 'ajaxSyncRequest("set-tapparella-cucina")'/>
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
						<td> <img src="images/tapparella.jpg" width = "50" height = "50"> </td>
                    </tr>
                    
					<tr>
                        <th> GESTIONE <br> AUTOMATICA LUCE</th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="LuceSalone-Auto" onclick = "AbilitaLuceSalone()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label>
						
						<select id = "Valore-LuceSalone" onclick = 'ajaxSyncRequest("set-luce-auto-salone")' disabled>
							<option value = "10"> livello 10 </option>
							<option value = "9"> livello 9 </option>
							<option value = "8"> livello 8 </option>
							<option value = "7"> livello 7 </option>
							<option value = "6"> livello 6 </option>
							<option value = "5" selected> livello 5 </option>
							<option value = "4"> livello 4 </option>
							<option value = "3"> livello 3 </option>
							<option value = "2"> livello 2 </option>
							<option value = "1"> livello 1 </option>
						</select>
						
						<td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="LuceCamera-Auto" onclick = "AbilitaLuceCamera()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label>
						
						<select id = "Valore-LuceCamera" onclick = 'ajaxSyncRequest("set-luce-auto-camera")' disabled> 
							<option value = "10"> livello 10 </option>
							<option value = "9"> livello 9 </option>
							<option value = "8"> livello 8 </option>
							<option value = "7"> livello 7 </option>
							<option value = "6"> livello 6 </option>
							<option value = "5" selected> livello 5 </option>
							<option value = "4"> livello 4 </option>
							<option value = "3"> livello 3 </option>
							<option value = "2"> livello 2 </option>
							<option value = "1"> livello 1 </option>
						</select>
						
						<td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="LuceBagno-Auto" onclick = "AbilitaLuceBagno()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label>
						
						<select id = "Valore-LuceBagno" onclick = 'ajaxSyncRequest("set-luce-auto-bagno")' disabled>
							<option value = "10"> livello 10 </option>
							<option value = "9"> livello 9 </option>
							<option value = "8"> livello 8 </option>
							<option value = "7"> livello 7 </option>
							<option value = "6"> livello 6 </option>
							<option value = "5" selected> livello 5 </option>
							<option value = "4"> livello 4 </option>
							<option value = "3"> livello 3 </option>
							<option value = "2"> livello 2 </option>
							<option value = "1"> livello 1 </option>
						</select>
						
						<td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="LuceCucina-Auto" onclick = "AbilitaLuceCucina()" />
						<span class="switch-label" data-on="On" data-off="Off"> </span> <span class="switch-handle"></span> </label>
						
						<select id = "Valore-LuceCucina" onclick = 'ajaxSyncRequest("set-luce-auto-cucina")' disabled>
							<option value = "10"> livello 10 </option>
							<option value = "9"> livello 9 </option>
							<option value = "8"> livello 8 </option>
							<option value = "7"> livello 7 </option>
							<option value = "6"> livello 6 </option>
							<option value = "5" selected> livello 5 </option>
							<option value = "4"> livello 4 </option>
							<option value = "3"> livello 3 </option>
							<option value = "2"> livello 2 </option>
							<option value = "1"> livello 1 </option>
						</select>
						
						<td> <img src="images/light-gif.gif" width = "80" height = "80"> </td>
                    </tr>
                    
					<tr>
                        <th> FINESTRA </th>
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Finestra-Salone" onclick = "SetFinestraSalone()" />
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Finestra-Camera" onclick = "SetFinestraCamera()" />
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Finestra-Bagno" onclick = "SetFinestraBagno()" />
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td>
						
						
                        <td> <label class="switch switch-flat">
						<input class="switch-input" type="checkbox" id="Finestra-Cucina" onclick = "SetFinestraCucina()" />
						<span class="switch-label" data-on="Open" data-off="Close"> </span> <span class="switch-handle"></span> </label> </td> 
						
						
						<td> <img id = "Window-pic" src="images/window-close.png" width = "50" height = "50"> </td>
                    </tr>
                </tbody>
            </table> 
	<span id="message"></span>

<script type = "text/javascript" language = "javascript">

function CambiaSicurezza()
{
	if (document.getElementById("Sicurezza").checked == true)
		document.getElementById("Security-pic").src = "images/lock.png";
	else
		document.getElementById("Security-pic").src = "images/unlock.png";
	ajaxSyncRequest("set-sicurezza");
}

function CambiaIncendio()
{
	if (document.getElementById("Incendio").checked == true)
		document.getElementById("Fire-pic").src = "images/fire-off.png";
	else
		document.getElementById("Fire-pic").src = "images/fire-on.png";
	ajaxSyncRequest("set-incendio");
}

function SetLuceSalone()
{
	CambiaLuce();
	ajaxSyncRequest("set-luce-salone");
}

function SetLuceCamera()
{
	CambiaLuce();
	ajaxSyncRequest("set-luce-camera");
}

function SetLuceBagno()
{
	CambiaLuce();
	ajaxSyncRequest("set-luce-bagno");
}

function SetLuceCucina()
{
	CambiaLuce();
	ajaxSyncRequest("set-luce-cucina");
}

function CambiaLuce()
{
	if (document.getElementById("Luce-Salone").checked == true || document.getElementById("Luce-Camera").checked == true || document.getElementById("Luce-Bagno").checked == true || document.getElementById("Luce-Cucina").checked == true)
		document.getElementById("Light-pic").src = "images/light-on.png";
	else
		document.getElementById("Light-pic").src = "images/light-off.png";
}

function SetFinestraSalone()
{
	CambiaFinestra();
	ajaxSyncRequest("set-finestra-salone");
}

function SetFinestraCamera()
{
	CambiaFinestra();
	ajaxSyncRequest("set-finestra-camera");
}

function SetFinestraBagno()
{
	CambiaFinestra();
	ajaxSyncRequest("set-finestra-bagno");
}

function SetFinestraCucina()
{
	CambiaFinestra();
	ajaxSyncRequest("set-finestra-cucina");
}

function CambiaFinestra()
{
	if (document.getElementById("Finestra-Salone").checked == true || document.getElementById("Finestra-Camera").checked == true || document.getElementById("Finestra-Bagno").checked == true || document.getElementById("Finestra-Cucina").checked == true)
		document.getElementById("Window-pic").src = "images/window-open.png";
	else
		document.getElementById("Window-pic").src = "images/window-close.png";
}

function ChiudiFinestre()
{
	document.getElementById("Finestra-Salone").disabled = true;
	document.getElementById("Finestra-Camera").disabled = true;
	document.getElementById("Finestra-Bagno").disabled = true;
	document.getElementById("Finestra-Cucina").disabled = true;
}

function ApriFinestre()
{
	document.getElementById("Finestra-Salone").disabled = false;
	document.getElementById("Finestra-Camera").disabled = false;
	document.getElementById("Finestra-Bagno").disabled = false;
	document.getElementById("Finestra-Cucina").disabled = false;
}

function AbilitaTemperatura()
{
	if(document.getElementById("Temperatura").checked == true)
	{
		ChiudiFinestre();
		document.getElementById("Valore-Temperatura").disabled = false;
	}
	else
	{
		ApriFinestre();
		document.getElementById("Valore-Temperatura").disabled = true;
		//ajaxSyncRequest("set-temperatura-off");
	}
	ajaxSyncRequest("set-temperatura-on-off");
}

function ChiudiLuceTapparellaSalone()
{
	document.getElementById("Luce-Salone").disabled = true;
	document.getElementById("Tapparella-Salone").disabled = true;
}

function ApriLuceTapparellaSalone()
{
	document.getElementById("Luce-Salone").disabled = false;
	document.getElementById("Tapparella-Salone").disabled = false;
}

function ChiudiLuceTapparellaCamera()
{
	document.getElementById("Luce-Camera").disabled = true;
	document.getElementById("Tapparella-Camera").disabled = true;
}

function ApriLuceTapparellaCamera()
{
	document.getElementById("Luce-Camera").disabled = false;
	document.getElementById("Tapparella-Camera").disabled = false;
}

function ChiudiLuceTapparellaBagno()
{
	document.getElementById("Luce-Bagno").disabled = true;
	document.getElementById("Tapparella-Bagno").disabled = true;
}

function ApriLuceTapparellaBagno()
{
	document.getElementById("Luce-Bagno").disabled = false;
	document.getElementById("Tapparella-Bagno").disabled = false;
}

function ChiudiLuceTapparellaCucina()
{
	document.getElementById("Luce-Cucina").disabled = true;
	document.getElementById("Tapparella-Cucina").disabled = true;
}

function ApriLuceTapparellaCucina()
{
	document.getElementById("Luce-Cucina").disabled = false;
	document.getElementById("Tapparella-Cucina").disabled = false;
}

function AbilitaLuceSalone()
{
	if(document.getElementById("LuceSalone-Auto").checked == true)
	{
		ChiudiLuceTapparellaSalone();
		document.getElementById("Valore-LuceSalone").disabled = false;
	}
	else
	{
		ApriLuceTapparellaSalone();
		document.getElementById("Valore-LuceSalone").disabled = true;
	}
	ajaxSyncRequest("set-luce-auto-salone-on-off");
}

function AbilitaLuceCamera()
{
	if(document.getElementById("LuceCamera-Auto").checked == true)
	{
		ChiudiLuceTapparellaCamera();
		document.getElementById("Valore-LuceCamera").disabled = false;
	}
	else
	{	
		ApriLuceTapparellaCamera();
		document.getElementById("Valore-LuceCamera").disabled = true;
	}
	ajaxSyncRequest("set-luce-auto-camera-on-off");
}

function AbilitaLuceBagno()
{
	if(document.getElementById("LuceBagno-Auto").checked == true)
	{
		ChiudiLuceTapparellaBagno();
		document.getElementById("Valore-LuceBagno").disabled = false;
	}
	else
	{
		ApriLuceTapparellaBagno();
		document.getElementById("Valore-LuceBagno").disabled = true;
	}
	ajaxSyncRequest("set-luce-auto-bagno-on-off");
}

function AbilitaLuceCucina()
{
	if(document.getElementById("LuceCucina-Auto").checked == true)
	{
		ChiudiLuceTapparellaCucina();
		document.getElementById("Valore-LuceCucina").disabled = false;
	}
	else
	{
		ApriLuceTapparellaCucina();
		document.getElementById("Valore-LuceCucina").disabled = true;
	}
	ajaxSyncRequest("set-luce-auto-cucina-on-off");
}

function ajaxSyncRequest(reqURL)
	{
		//Creating a new XMLHttpRequest object
		var xmlhttp;
		if (window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}
		
		if (reqURL == "set-temperatura")
			reqURL = reqURL + "-" + document.getElementById("Valore-Temperatura").value;
		
		if (reqURL == "set-luce-auto-salone")
			reqURL = reqURL + "-" + document.getElementById("Valore-LuceSalone").value;
		
		if (reqURL == "set-luce-auto-camera")
			reqURL = reqURL + "-" + document.getElementById("Valore-LuceCamera").value;
		
		if (reqURL == "set-luce-auto-bagno")
			reqURL = reqURL + "-" + document.getElementById("Valore-LuceBagno").value;
		
		if (reqURL == "set-luce-auto-cucina")
			reqURL = reqURL + "-" + document.getElementById("Valore-LuceCucina").value;
		
		//Create a asynchronous GET request
		xmlhttp.open("GET", reqURL, false);
		xmlhttp.send(null);
		
		//Execution blocked till server send the response
		if (xmlhttp.readyState == 4) 
		{ 
			if (xmlhttp.status == 200)
			{
				document.getElementById("message").innerHTML = "";
			
				if (reqURL == "get-sicurezza")
				{
					if (xmlhttp.responseText == "false")
					{
						document.getElementById("Sicurezza").checked = false;
						document.getElementById("Security-pic").src = "images/unlock.png";
					}
					else
					{
						document.getElementById("Sicurezza").checked = true;
						document.getElementById("Security-pic").src = "images/lock.png";
					}
				}
				
				if (reqURL == "get-box-auto")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Garage").checked = false;
					else
						document.getElementById("Garage").checked = true;
				}
				
				if (reqURL == "get-temperatura")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Temperatura").checked = false;
					else
						{
							document.getElementById("Temperatura").checked = true;
							document.getElementById("Valore-Temperatura").disabled = false;
							document.getElementById("Valore-Temperatura").value = parseInt(xmlhttp.responseText);
							ChiudiFinestre();
						}
				}
				
				if (reqURL == "get-temp-corr")
					document.getElementById("Temperatura-Corrente").innerHTML = xmlhttp.responseText;
				
				if (reqURL == "get-incendio")
				{
					if (xmlhttp.responseText == "false")
					{
						document.getElementById("Incendio").checked = false;
						document.getElementById("Fire-pic").src = "images/fire-on.png";
					}
					else
					{
						document.getElementById("Incendio").checked = true;
						document.getElementById("Fire-pic").src = "images/fire-off.png";
					}
				}
				
				if (reqURL == "get-luce-salone")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Luce-Salone").checked = false;
					else
						document.getElementById("Luce-Salone").checked = true;
					
					CambiaLuce();
				}
				
				if (reqURL == "get-luce-camera")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Luce-Camera").checked = false;
					else
						document.getElementById("Luce-Camera").checked = true;
					
					CambiaLuce();
				}
				
				if (reqURL == "get-luce-bagno")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Luce-Bagno").checked = false;
					else
						document.getElementById("Luce-Bagno").checked = true;
					
					CambiaLuce();
				}
				
				if (reqURL == "get-luce-cucina")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Luce-Cucina").checked = false;
					else
						document.getElementById("Luce-Cucina").checked = true;
					
					CambiaLuce();
				}
				
				if (reqURL == "get-tapparella-salone")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Tapparella-Salone").checked = false;
					else
						document.getElementById("Tapparella-Salone").checked = true;
				}
				
				if (reqURL == "get-tapparella-camera")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Tapparella-Camera").checked = false;
					else
						document.getElementById("Tapparella-Camera").checked = true;
				}
				
				if (reqURL == "get-tapparella-bagno")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Tapparella-Bagno").checked = false;
					else
						document.getElementById("Tapparella-Bagno").checked = true;
				}
				
				if (reqURL == "get-tapparella-cucina")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Tapparella-Cucina").checked = false;
					else
						document.getElementById("Tapparella-Cucina").checked = true;
				}
				
				if (reqURL == "get-luce-auto-salone")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("LuceSalone-Auto").checked = false;
					else
						{
							document.getElementById("LuceSalone-Auto").checked = true;
							document.getElementById("Valore-LuceSalone").disabled = false;
							document.getElementById("Valore-LuceSalone").value = parseInt(xmlhttp.responseText);
							
							ChiudiLuceTapparellaSalone();
						}
				}
				
				if (reqURL == "get-luce-auto-camera")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("LuceCamera-Auto").checked = false;
					else
						{
							document.getElementById("LuceCamera-Auto").checked = true;
							document.getElementById("Valore-LuceCamera").disabled = false;
							document.getElementById("Valore-LuceCamera").value = parseInt(xmlhttp.responseText);
							
							ChiudiLuceTapparellaCamera();
						}
				}
				
				if (reqURL == "get-luce-auto-bagno")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("LuceBagno-Auto").checked = false;
					else
						{
							document.getElementById("LuceBagno-Auto").checked = true;
							document.getElementById("Valore-LuceBagno").disabled = false;
							document.getElementById("Valore-LuceBagno").value = parseInt(xmlhttp.responseText);
							
							ChiudiLuceTapparellaBagno();
						}
				}
				
				if (reqURL == "get-luce-auto-cucina")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("LuceCucina-Auto").checked = false;
					else
						{
							document.getElementById("LuceCucina-Auto").checked = true;
							document.getElementById("Valore-LuceCucina").disabled = false;
							document.getElementById("Valore-LuceCucina").value = parseInt(xmlhttp.responseText);
							
							ChiudiLuceTapparellaCucina();
						}
				}
				
				if (reqURL == "get-finestra-salone")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Finestra-Salone").checked = false;
					else
						document.getElementById("Finestra-Salone").checked = true;
					
					CambiaFinestra();
				}
				
				if (reqURL == "get-finestra-camera")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Finestra-Camera").checked = false;
					else
						document.getElementById("Finestra-Camera").checked = true;
					
					CambiaFinestra();
				}
				
				if (reqURL == "get-finestra-bagno")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Finestra-Bagno").checked = false;
					else
						document.getElementById("Finestra-Bagno").checked = true;
					
					CambiaFinestra();
				}
				
				if (reqURL == "get-finestra-cucina")
				{
					if (xmlhttp.responseText == "false")
						document.getElementById("Finestra-Cucina").checked = false;
					else
						document.getElementById("Finestra-Cucina").checked = true;
					
					CambiaFinestra();
				}
			}
			
			else
			{
				alert('Something is wrong !!');
			}
		}
	}
	
function codeAddress()
{
	ajaxSyncRequest("get-sicurezza");
	ajaxSyncRequest("get-box-auto");
	ajaxSyncRequest("get-temp-corr");
	ajaxSyncRequest("get-temperatura");
	ajaxSyncRequest("get-incendio");
	ajaxSyncRequest("get-luce-salone");
	ajaxSyncRequest("get-luce-camera");
	ajaxSyncRequest("get-luce-bagno");
	ajaxSyncRequest("get-luce-cucina");
	ajaxSyncRequest("get-tapparella-salone");
	ajaxSyncRequest("get-tapparella-camera");
	ajaxSyncRequest("get-tapparella-bagno");
	ajaxSyncRequest("get-tapparella-cucina");
	ajaxSyncRequest("get-luce-auto-salone");
	ajaxSyncRequest("get-luce-auto-camera");
	ajaxSyncRequest("get-luce-auto-bagno");
	ajaxSyncRequest("get-luce-auto-cucina");
	ajaxSyncRequest("get-finestra-salone");
	ajaxSyncRequest("get-finestra-camera");
	ajaxSyncRequest("get-finestra-bagno");
	ajaxSyncRequest("get-finestra-cucina");
	
}

</script>
</body>
</html>