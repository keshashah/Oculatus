addpkg('rHighcharts','1.0-r30')
library(rHighcharts)
actionButton <- function(inputId, label, style = "" , additionalClass = "") {
  class.style = "btn-primary"
  tags$button(id=inputId, type="button", class=paste("btn action-button",class.style,additionalClass), label)
}
shinyUI(
  fluidPage(
    HTML(
      '<title>Robo Advisor</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">
<nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header page-scroll">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand page-scroll" href="#page-top">Wealth Manager</a>
      </div>
      
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <li class="hidden">
      <a href="#page-top"></a>
      </li>
      <li>
      <a class="page-scroll" href="#about">About</a>
      </li>
      <li>
      <a class="page-scroll" href="#dashboard">Dashboard</a>
      </li>
      <li>
      <a class="page-scroll" href="#FedRate">Fed Opinion</a>
      </li>
      <li>
      <a class="page-scroll" href="#current">Current Market</a>
      </li>
      <li>
      <a class="page-scroll" href="#performance">Performance Tracker</a>
      </li>
      
     
      
      
      </ul>
      </div>
      <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
      </nav>
<header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Wealth Manager</div>
                <div class="intro-heading">Automated Solution to your Portfolio needs</div>
                <a href="#dashboard" class="page-scroll btn btn-xl">Take Me There</a>
            </div>
        </div>
    </header>
<section id="about">
        <div class="container">
            <div class="row">
      <div class="col-lg-12 text-center">
      <h2 class="section-heading">About</h2>
      <h3 class="section-subheading text-muted">Why Wealth Manager?</h3>
      <h3 class="section-subheading text-muted">Automated advice on the status of the market.

Given a set of investments, we optimize the amount the investor has to dedicate to each security.
The investor can choose three approaches:
<p class="section-subheading text-muted">A conservative approach with minimum risk</p>
<p class="section-subheading text-muted">An aggressive approach with maximum return</p>
<p class="section-subheading text-muted">A balance of the above two</p>
<p class="section-subheading text-muted">Other features</p>
<p class="section-subheading text-muted">Monitor Portfolio performance</p>
      </div>
      </div>
      <div class="row">
      <div class="col-lg-12">
      <ul class="timeline">
      <li>
      <div class="timeline-image">
      <img class="img-circle img-responsive" src="img/iStock_000047147652Small.jpg" alt="">
      </div>
      <div class="timeline-panel">
      <div class="timeline-heading">
      
      <h4 class="subheading">Beating market made easy!!</h4>
      </div>
      <div class="timeline-body">
      <p class="text-muted">Sentimenatal Analysis, Historical Analysis and other mechanisms of Analysis gives you the edge</p>
      </div>
      </div>
      </li>
      <li class="timeline-inverted">
      <div class="timeline-image">
      <img class="img-circle img-responsive" src="img/images.jpg" alt="">
      </div>
      <div class="timeline-panel">
      <div class="timeline-heading">
      
      <h4 class="subheading">Build Wealth</h4>
      </div>
      <div class="timeline-body">
      <p class="text-muted">Scientific and Statisticial methods help you make the right choices and decisions</p>
      </div>
      </div>
      </li>
      <li>
      <div class="timeline-image">
      <img class="img-circle img-responsive" src="img/images_1.jpg" alt="">
      </div>
      <div class="timeline-panel">
      <div class="timeline-heading">
      
      <h4 class="subheading">Lesser Time</h4>
      </div>
      <div class="timeline-body">
      <p class="text-muted">Analysis just a click away.(we dont take as much time as your FA does :p). Automation translates to less errors </p>
      </div>
      </div>
      </li>
      <li class="timeline-inverted">
      <div class="timeline-image">
      <img class="img-circle img-responsive" src="img/images.png" alt="">
      </div>
      <div class="timeline-panel">
      <div class="timeline-heading">
      
      <h4 class="subheading">More Returns</h4>
      </div>
      <div class="timeline-body">
      <p class="text-muted">Get the best return for your money</p>
      </div>
      </div>
      </li>
      <li class="timeline-inverted">
      <div class="timeline-image">
      <h4>Be Part
      <br>Of Our
      <br>Story!</h4>
      </div>
      </li>
      </ul>
      </div>
      </div>
      </div>
      </section>
      <section id="works" >
      <div class="container">
      <div class="row">
      <div class="col-lg-12 text-center">
      <h2 class="section-heading">How Wealth Manager Works </h2>
<br /><br /><br /><br /><br /><br /><br /><br />
      </div>
      </div>
      <div class="row">
      <div class="col-md-4 col-sm-6 portfolio-item">
      
      <!--    <div class="portfolio-hover">
     
      <div class="portfolio-hover-content">
      <i class="fa fa-plus fa-3x"></i>
      </div>
      </div> --!>
      <img src="img/consult_types_centralimage.jpg" alt="">
      
      <div class="portfolio-caption">
      <h3><center>Consult</center></h3>
      <h3 class="section-subheading text-muted"><center>Get the best investment plan!!</center></h3>
      </div>
      </div>
      
      
      
      <div class="col-md-4 col-sm-6 portfolio-item">
      
      <img src="img/Graph.jpg"  alt="">
      
      <div class="portfolio-caption">
      <h3><center>Get Returns</center></h3>
      <h3 class="section-subheading text-muted"><center>Make money</center></h3>
      
      </div>
      </div>
      <div class="col-md-4 col-sm-6 portfolio-item">
      
      
      <img src="img/relax_with_lots_of_money_md_wm.gif" class="img-responsive" alt="">
      
      <div class="portfolio-caption">
      <h3><center>Take a Break :D</center></h3>
      <h3 class="section-subheading text-muted"><center>You do deserve a break</center></h3>
      
      </div>
      </div>
      <!--    <div class="col-md-4 col-sm-6 portfolio-item">
      <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">
      <div class="portfolio-hover">
      <div class="portfolio-hover-content">
      <i class="fa fa-plus fa-3x"></i>
      </div>
      </div>
      <img src="img/portfolio/golden.png" class="img-responsive" alt="">
      </a>
      <div class="portfolio-caption">
      <h4>Golden</h4>
      <p class="text-muted">Website Design</p>
      </div>
      </div>
      <div class="col-md-4 col-sm-6 portfolio-item">
      <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal">
      <div class="portfolio-hover">
      <div class="portfolio-hover-content">
      <i class="fa fa-plus fa-3x"></i>
      </div>
      </div>
      <img src="img/portfolio/escape.png" class="img-responsive" alt="">
      </a>
      <div class="portfolio-caption">
      <h4>Escape</h4>
      <p class="text-muted">Website Design</p>
      </div>
      </div>
      <div class="col-md-4 col-sm-6 portfolio-item">
      <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal">
      <div class="portfolio-hover">
      <div class="portfolio-hover-content">
      <i class="fa fa-plus fa-3x"></i>
      </div>
      </div>
      <img src="img/portfolio/dreams.png" class="img-responsive" alt="">
      </a>
      <div class="portfolio-caption">
      <h4>Dreams</h4>
      <p class="text-muted">Website Design</p>
      </div>
      </div>-->
      </div>
      </div>
      </section>

<section id="dashboard" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">My Portfolio</h2>
                    <h3 class="section-subheading text-muted">Do not put all eggs in the basket- Warren Buffet</h3>
                    <br /><br /><br /><br /><br />
                </div>
            </div>
            
  				
        
      '
      ),
    
    
      
      
     
    fluidRow(column(3,  
                    selectizeInput(
                      'stock', 'Select Portfolio', choices = SP500.ticlist, multiple = TRUE,selected=t
                    ),
                    
                    selectInput("type", "What would you go for?", c("Empty"=1," "=2,"Balanced"=3,"Maximum Return"=4,"Minimum Risk"=5,"Diversified Portfolio"=6),selected=2),
                    
                    dateInput('date',
                              label = 'Check Portfolio composition for date',
                              value = as.character(Sys.Date())
                    ) ),column(1),column(4,chartOutput('types')),column(2),column(2,tableOutput('table'))),
    HTML('<br /><br /><br /><br /><br /><br />'),
    uiOutput('hist5'),
    HTML('<h4 class="subheading">Co Variance Matrix</h4>'),
    fluidRow(column(2),column(6,imageOutput('hist1')),column(4,HTML('<p><br /> <br />The numbers indicate how the stocks are dependent on each other. Higher the number, higher is the stock dependency</p>'))),
    HTML('<h4 class="subheading">Co relation</h4>'),
    fluidRow(column(2),column(6,imageOutput('hist3')),column(4,HTML('<p><br /> <br />Its the co relation graph between the stocks</p>'))),
    HTML('<h4 class="subheading">Cumulative Returns</h4>'),
    fluidRow(column(2),column(6,imageOutput('hist2')),column(4,HTML('<p><br /> <br />The historic returns of each security are plotted here</p>'))),
    #HTML('<h4 class="subheading">Efficient Frontier</h4>'),
   # fluidRow(column(2),column(6,imageOutput('hist4')),column(4,HTML('<p><br /> <br />Efficient Frontier represents the balance between risk and return.
#</p>'))),
    HTML('</div>
    </section>

         <section id="FedRate" style="color:white;background-color:#222;">
         <div class="container">
         <div class="row">
         <div class="col-lg-12 text-center">
         <h2 class="section-heading">WHAT THE FED THINKS</h2>
         <h3 class="section-subheading text-muted">The rate of interest acts as a link between income value and capital value- Irving Fisher</h3>
         </div>
         </div>'),
    fluidRow(style="width:100%;",column(12,style="text-align:center",uiOutput("fed"))),
    fluidRow(style="width:100%;",column(12,verbatimTextOutput("op"))),
    fluidRow(style="width:100%;",column(12,plotOutput("fedplot"))),
    
    
  HTML('</div>
    </section>
<section id="current">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Current Market</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>
               	
			'),
  textInput("symb", "Symbol", "MS"),
  chartOutput('senti'),
  textInput("news", "News Item", "1"),
  verbatimTextOutput("newsitem"),
  br(),
  HTML('<center><h3 class="section-subheading">PUBLIC SENTIMENT TOWARDS SECTORS</h3></center>'),
  selectInput("sector", "Choose Sector", c("Consumer Discretionary"=1,"Staples"=2,"Energy"=3,"Financials"=4,"Healthcare"=5,"Industrials"=6,"Technology"=7,"Materials"=8,"Telecom"=9,"Utilities"=10)),
  chartOutput('sectorsenti'),
  textInput("news1", "News Item", "1"),
  verbatimTextOutput("sectornewsitem")
  
  ,HTML('</div>
    </section>

<section id="performance" style="color:white;background-color:#222;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">PERFORMANCE TRACKER</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>'),
  
  fluidRow(style="width:100%;",column(2,sidebarPanel(style="margin-top:30px;color:#fed136;background-color:#222;width:220px",
                                                     
                                                     
                                                     textInput("symb1", "Symbol", "MS"),
                                                     
                                                     dateRangeInput("dates", 
                                                                    "Date range",
                                                                    start = "2013-01-01", 
                                                                    end = as.character(Sys.Date())),
                                                     
                                                     HTML('<center>'),
                                                     
                                                     actionButton(style='id="get" class="btn btn-xl"',"get", "GET STOCK"),
                                                     HTML('</center>'),
                                                     
                                                     
                                                     
                                                     checkboxInput("log", "", 
                                                                   value = FALSE),
                                                     
                                                     checkboxInput("adjust", 
                                                                   "", value = FALSE)
  )),column(1),column(9,
                      plotOutput("plot"))), br(),br(),br(), HTML("<center><h5 style='color:white;'>Check Earnings of a Portfolio from given date till today</h5></center>"),
  dateInput('newdate',
            label = 'Date',
            value = as.character(Sys.Date()-100)),
  selectizeInput(
    'equity', 'Select Portfolio', choices = SP500.ticlist, multiple = TRUE,selected=c("AAPL","IBM","GS","INTC","MS")
  ),
  fluidRow(column(1,uiOutput('sel'))),br(),
  fluidRow(column(8,plotOutput('mod'))),
  #HTML("<center><h5 style='color:white;'>Cumulative Returns:</h5></center>"),
  #uiOutput("returns"),
HTML('</div>
    </section>




<script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>
       ')
    )
)
