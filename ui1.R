shinyUI(
  fluidPage(
    HTML('<center>'),textInput("symb", "Company", "OLA"),HTML('</center>'),
    HTML('<center><b>News Sentiment Meter</b>'),
    htmlOutput("totalSentiment"),
    htmlOutput("sentimentgauge"),HTML('</center>'),
    chartOutput('senti'),
    htmlOutput("marketshare"),
    textInput("news", "News Item", "1"),
    chartOutput('leadershipScore'),
    verbatimTextOutput("newsitem"),
    br(),
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