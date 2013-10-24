<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>Ecofin - Contacto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Html5TemplatesDreamweaver.com">

    <link href="scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="scripts/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Icons -->
    <link href="scripts/icons/general/stylesheets/general_foundicons.css" media="screen" rel="stylesheet" type="text/css" />  
    <link href="scripts/icons/social/stylesheets/social_foundicons.css" media="screen" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
        <link href="scripts/icons/general/stylesheets/general_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="scripts/icons/social/stylesheets/social_foundicons_ie7.css" media="screen" rel="stylesheet" type="text/css" />
    <![endif]-->
    <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome.min.css">
    <!--[if IE 7]>
        <link rel="stylesheet" href="scripts/fontawesome/css/font-awesome-ie7.min.css">
    <![endif]-->

    <link href="scripts/wookmark/css/style.css" rel="stylesheet" type="text/css" />	<link href="scripts/yoxview/yoxview.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Syncopate" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Pontano+Sans" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet" type="text/css">

    <link href="styles/custom.css" rel="stylesheet" type="text/css" />
    <script src="email/validation.js" type="text/javascript"></script>
</head>
<body id="pageBody">

<div id="divBoxed" class="container">

    <div class="transparent-bg" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: -1;zoom: 1;"></div>

    <div class="divPanel notop nobottom">
            <div class="row-fluid">
                <div class="span12">

                    <div id="divLogo" class="pull-left">
                        <a href="index.html" id="divSiteTitle"><img src="images/logo.png" alt="Ecofin" title="Ecofin: Asesores de Inversión" /></a>
                    </div>

  					<div id="divMenuRight" class="pull-right">
                    <div class="navbar">
                        <button type="button" class="btn btn-navbar-highlight btn-large btn-primary" data-toggle="collapse" data-target=".nav-collapse">
                        NAVIGATION <span class="icon-chevron-down icon-white"></span>
                        </button>
                        <div class="nav-collapse collapse">
                            <ul class="nav nav-pills ddmenu">
                            <li><a href="index.html">Home</a></li>
							<li class="dropdown">
                            <a href="empresa.html" class="dropdown-toggle">Empresa</a>
                            <li class="dropdown">
                            <a href="inversiones.html" class="dropdown-toggle">Inversiones</a>
                                <ul class="dropdown-menu">
                                <li><a href="inversiones-cfd.html">CFD</a></li>
                                <li><a href="inversiones-fondos.html">Fondos de Inversión</a></li>
                                <li><a href="inversiones-offshore.html">Offshore</a></li>
                                <li><a href="inversiones-family.html">Family office</a></li>
                                <li><a href="inversiones-jubilacion.html">Jubilación</a></li>
                            	</li>
                            </ul>
                            <li class="dropdown">
                            <a href="regulacion.html" class="dropdown-toggle">Regulación</a>
                            <ul class="dropdown-menu">
                                <li><a href="regulacion-mercado.html">Superintendencia de Mercado</a></li>
                                <li><a href="regulacion-brokers.html">Brokers</a></li>
                                </li>
                            </ul>
						    <li class="active"><a href="contacto.php">Contacto</a></li>
                            <li><a href="eventos.html">Eventos</a></li>
                            </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <div id="contentInnerSeparator"></div>
                </div>
            </div>
    </div>

    <div class="contentArea">

        <div class="divPanel notop page-content">

            <div class="breadcrumbs">
                <a href="index.html">Home</a> &nbsp;/&nbsp; <span>Contacto</span>
            </div>
            	
            <div class="row-fluid">
            	<div class="span12">
                <h1>Contacto</h1>
                        <hr>
                        <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps?t=m&amp;q=edificio+ocean+business+plaza&amp;ie=UTF8&amp;ll=8.977154,-79.524536&amp;spn=0.029673,0.068665&amp;z=14&amp;output=embed" class="img-polaroid" style="margin:5px 0px 15px;" alt=""></iframe><br />
                </div>
            </div>
            <div class="row-fluid">
                <div class="span8" id="divMain">
                   	<h3 style="color:#FF6633;"><?php echo @$_GET['msg'];?></h3>
					<hr>
			<!--Start Contact form -->		                                                
<form name="enq" method="post" action="email/" onsubmit="return validation();">
  <fieldset>
    
	<input type="text" name="name" id="name" value=""  class="input-block-level" placeholder="Nombre" />
    <input type="text" name="email" id="email" value="" class="input-block-level" placeholder="Email" />
    <textarea rows="11" name="message" id="message" class="input-block-level" placeholder="Mensaje"></textarea>
    <div class="actions">
	<input type="submit" value="Enviar" name="submit" id="submitButton" class="btn btn-secondary pull-right" title="Hás click para enviar!" />
	</div>
	
	</fieldset>
</form>  				 
			<!--End Contact form -->											 
                </div>
				
			<!--Edit Sidebar Content here-->	
                <div class="span4 sidebar">

                    <div class="sidebox">
                        <h3 class="sidebox-title">Información</h3>
                    <p>
                        <address><strong>Ecofin: Asesores de Inversión</strong><br />
                        Direcciones<br />
                        Panamá<br/>Casa Matriz<br /><br />Calle Aquilino de la Guardia, Torre Banesco<br />Edificio Ocean Business Plaza, Marbella<br />Oficina 2402, Piso 24<br />Ciudad de Panamá, Panamá<br /><abbr title="Phone">Tel:</abbr>+507 282 0800<br />Fax: +507 264 0351
                        </address> 
                        <address>  <strong>Email</strong><br />
                        <a href="mailto:administración@ecofincapital.com">administración@ecofincapital.com</a></address>  
                    </p>     
                    					
                    </div>
					
					
                    
                </div>
			<!--/End Sidebar Content-->
				
				
            </div>			

            <div id="footerInnerSeparator"></div>
        </div>
    </div>

 <div id="footerOuterSeparator"></div>

    <div id="divFooter" class="footerArea">

        <div class="divPanel">

            <div class="row-fluid">
                <div class="span3" id="footerArea1">
                
                    <h3>Empresa</h3>

                    <p>Ecofin Asesores de Inversión fue fundada por un grupo de expertos en el mercado financiero. Tanto los socios, como el grupo de analistas financieros que incorporan el Departamento de Análisis y Estrategias son titulados por importantes universidades y han vivido el día a día de la mesa de operaciones de bancos y brokers en muchas partes del mundo.</p>
                    
                    <p> 
                        <a href="empresa.html" title="Empresa">Mission/ Vision</a><br />
                    </p>

                </div>
                <div class="span3" id="footerArea2">

                    <h3>Inversiones</h3> 
                    <p>
                        <a href="inversiones-cfd.html" title="CFD">CFD</a><br />
                    </p>
                    <p>
                        <a href="inversiones-fondos.html" title="Fondos de inversión">Fondos de inversión</a><br />
                    </p>
                    <p>
                        <a href="inversiones-offshore.html" title="Offshore">Offshore</a><br />
                    </p>
                    <p>
                        <a href="inversiones-family.html" title="Family Office">Family Office</a>
                    </p>
                    <p>
                        <a href="inversiones-jubilacion.html" title="Jubilación">Jubilación</a>
                    </p>

                </div>
                <div class="span3" id="footerArea3">

                    <!--<h3>Sample Content</h3> 
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s. 
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s.
                    </p>-->

                </div>
                <div class="span3" id="footerArea4">

                    <h3>Contacto</h3>  
                                                               
                    <ul id="contact-info">
                    <li>                                    
                        <i class="general foundicon-phone icon"></i>
                        <span class="field">Teléfono:</span>
                        <br />
                        Tel: +507 282 0800<br /><br />                                            
                    </li>
                    <li>
                        <i class="general foundicon-mail icon"></i>
                        <span class="field">Email:</span>
                        <br />
                        <a href="mailto:administración@ecofincapital.com" title="Email">administración@ecofincapital.com</a><br /><br />
                    </li>
                    <li>
                        <i class="general foundicon-home icon" style="margin-bottom:50px"></i>
                        <span class="field">Direcciones:</span>
                        <br />
                        Panamá<br />
                        Casa Matriz<br /><br/>
                        Calle Aquilino de la Guardia, Torre Banesco<br />
                        Edificio Ocean Business Plaza, Marbella<br />
                        Oficina 2402, Piso 24<br />
                        Ciudad de Panamá, Panamá<br />
                    </li>
                    </ul>

                </div>
            </div>

            <br /><br />
            <div class="row-fluid">
                <div class="span12">
                    <p class="copyright">
                        Copyright © 2013 Ecofin. All Rights Reserved.
                    </p>

                    <!-- <p class="social_bookmarks">
                        <a href="#"><i class="social foundicon-facebook"></i> Facebook</a>
			<a href=""><i class="social foundicon-twitter"></i> Twitter</a>
			<a href="#"><i class="social foundicon-pinterest"></i> Pinterest</a>
			<a href="#"><i class="social foundicon-rss"></i> Rss</a>
                    </p> -->
                </div>
            </div>

        </div>
    </div>
</div>
<br /><br /><br />


<script src="scripts/jquery.min.js" type="text/javascript"></script> 
<script src="scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="scripts/default.js" type="text/javascript"></script>

<script src="scripts/wookmark/js/jquery.wookmark.js" type="text/javascript"></script>
<script type="text/javascript">$(window).load(function () {var options = {autoResize: true,container: $('#gridArea'),offset: 10};var handler = $('#tiles li');handler.wookmark(options);$('#tiles li').each(function () { var imgm = 0; if($(this).find('img').length>0)imgm=parseInt($(this).find('img').not('p img').css('margin-bottom')); var newHeight = $(this).find('img').height() + imgm + $(this).find('div').height() + $(this).find('h4').height() + $(this).find('p').not('blockquote p').height() + $(this).find('iframe').height() + $(this).find('blockquote').height() + 5;if($(this).find('iframe').height()) newHeight = newHeight+15;$(this).css('height', newHeight + 'px');});handler.wookmark(options);handler.wookmark(options);});</script>
<script src="scripts/yoxview/yox.js" type="text/javascript"></script>
<script src="scripts/yoxview/jquery.yoxview-2.21.js" type="text/javascript"></script>
<script type="text/javascript">$(document).ready(function () {$('.yoxview').yoxview({autoHideInfo:false,renderInfoPin:false,backgroundColor:'#ffffff',backgroundOpacity:0.8,infoBackColor:'#000000',infoBackOpacity:1});$('.yoxview a img').hover(function(){$(this).animate({opacity:0.7},300)},function(){$(this).animate({opacity:1},300)});});</script>


</body>
</html>