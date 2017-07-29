addpkg('corrplot','0.73-r30')
library(corrplot)
addpkg('rHighcharts','1.0-r30')
library(rHighcharts)
source('r/roboadv/PortfolioOptimiser.R')
source('r/roboadv/userdifPF.R')
ret<-0
shinyServer(function(input,output,session){
  
  
  
    
  
 # print(pflist[[1]]$historicalPF$tangency.pf$weights)
  
  
  #output$choice<-renderUI({
   # ind<-1
   # inde<-list(ind)
   # pflist[[length(pflist)+1]]<-buildNewPortfolio(input$stock,input$date)
    #while(ind<=length(pflist))
   # {
   #   ind<-ind+1
   #   inde[[length(inde)+1]]<-ind
   # }
   # selectInput('placeholder','Created Portfolio',choices=inde)
    
  #})
  
  #createf<-function(n)
  #{
    #if(is.null(n))
    #{
      
   # }
    #else
    #{
    #  pflist[[length(pflist)+1]]<-buildNewPortfolio(n)
    #  print('laud')
     # print(pflist[[2]]$tickerList)
    #}
    
  #}
  #create<-reactive({
   #  createf(input$stock)
 # })
  
  
  output$types <- renderChart({
    
    
    #pflist[[length(pflist)+1]]<-buildNewPortfolio(input$stock,input$date)
    #currentpfindex<-as.numeric(input$placeholder)
    pf<-buildNewPortfolio(input$stock,input$date)
    
   if(input$type==1)
   {
     a <- rHighcharts:::Chart$new()
     
     a$data(x = pf$tickerList, y =  as.numeric(pf$historicalPF$tangency.pf$weights), type = "pie", name = "Percent",size=150)
     a$title(text = "Portfolio")
     a$subtitle(text = "Weight Distribution")
   }   
    if(input$type==2)
    {
      #only plot
      a <- rHighcharts:::Chart$new()
      a$title(text = "Portfolio")
      a$subtitle(text = "Weight Distribution")
      a$data(x = pf$tickerList, y =  as.numeric(pf$historicalPF$tangency.pf$weights), type = "pie", name = "Percent",size=150)
      return(a)
      #print(pf$tickerList)
      #print(as.numeric(pf$historicalPF$tangency.pf$weights))
    }
    else if(input$type==3)
    {
      pf<-capmAnalysis(pf)
      a <- rHighcharts:::Chart$new()
      a$title(text = "Portfolio")
      a$subtitle(text = "Weight Distribution")
      a$data(x = pf$tickerList, y =  as.numeric(pf$historicalPF$tangency.pf$weights), type = "pie", name = "Percent",size=150)
      return(a)
    }
    else if(input$type==4)
    {
      pf<-cvarAnalysis.tan(pf,'LongOnly')
      a <- rHighcharts:::Chart$new()
      a$title(text = "Portfolio")
      a$subtitle(text = "Weight Distribution")
      a$data(x = pf$tickerList, y =  as.numeric(getWeights(pf$cvarPF$tanpf[[1]])), type = "pie", name = "Percent",size=150)
      return(a)
    }
    else if(input$type==5)
    {
      pf<-cvarAnalysis.minRisk(pf,'LongOnly')
      a <- rHighcharts:::Chart$new()
      a$title(text = "Portfolio")
      a$subtitle(text = "Weight Distribution")
      a$data(x = pf$tickerList, y =  as.numeric(getWeights(pf$cvarPF$minRiskpf[[1]])), type = "pie", name = "Percent",size=150)
      return(a)
    }
    else if(input$type==6)
    {
      #pf<-mfmAnalysis(pf)
      #pf$tickerList
      #as.numeric(pf$mfmPF$rmodel.pf)
      pf<-mfmAnalysis(pf)
      a <- rHighcharts:::Chart$new()
      a$title(text = "Portfolio")
      a$subtitle(text = "Weight Distribution")
      a$data(x = pf$tickerList, y = as.numeric(pf$mfmPF$rmodel.pf) , type = "pie", name = "Percent",size=150)
      return(a)
    }
    
  })
 
  
 output$table <- renderTable({
   
   
   pf<-buildNewPortfolio(input$stock,input$date)
   
   
   
   if(input$type==1)
   {
     
   }   
   if(input$type==2)
   {
     data.frame(Security=pf$tickerList,Weight=as.numeric(pf$historicalPF$tangency.pf$weights))
     
     #print(pf$tickerList)
     #print(as.numeric(pf$historicalPF$tangency.pf$weights))
   }
   else if(input$type==3)
   {
     pf<-capmAnalysis(pf)
     data.frame(Security=pf$tickerList,Weight=as.numeric(pf$historicalPF$tangency.pf$weights))
     
   }
   else if(input$type==4)
   {
     pf<-cvarAnalysis.tan(pf,'LongOnly')
     data.frame(Security=pf$tickerList,Weight=as.numeric(getWeights(pf$cvarPF$tanpf[[1]])))
     
   }
   else if(input$type==5)
   {
     pf<-cvarAnalysis.minRisk(pf,'LongOnly')
     data.frame(Security=pf$tickerList,Weight=as.numeric(getWeights(pf$cvarPF$minRiskpf[[1]])))
     
   }
   
   
   
 })
  output$hist5<-renderUI({
    
    if(input$type==6)
    {
      img(src="RvsHR.png")
      
    }
    else
    {
      print("")
    }
    
    
  })
   output$hist1<-renderImage({
    pf<-buildNewPortfolio(input$stock,input$date)
    
    ret.mat = listtomat(pf$returnList , pf$tickerList)
    #png("www/creturn.png", width = 400, height = 300)
    outfile <- tempfile(fileext='.png')
    png(outfile, width=400, height=300)
      
    chart.Correlation(ret.mat)
    dev.off()
    #img(src="creturn.png")
    list(src = outfile,
         width = 400,
         height = 300,
         alt = "This is alternate text")
    
  },deleteFile=TRUE)
 
 output$hist2<-renderImage({
   pf<-buildNewPortfolio(input$stock,input$date)
   
   ret.mat = listtomat(pf$returnList , pf$tickerList)
   #png("www/creturn.png", width = 400, height = 300)
   outfile <- tempfile(fileext='.png')
   png(outfile, width=400, height=300)
   
   chart.CumReturns(ret.mat , wealth.index=TRUE , main = '' , begin = 'axis' , legend.loc = 'topleft')
   dev.off()
   #img(src="creturn.png")
   list(src = outfile,
        width = 400,
        height = 300,
        alt = "This is alternate text")
   
 },deleteFile=TRUE)
 
 output$hist3<-renderImage({
   pf<-buildNewPortfolio(input$stock,input$date)
   
   ret.mat = listtomat(pf$returnList , pf$tickerList)
   #png("www/creturn.png", width = 400, height = 300)
   outfile <- tempfile(fileext='.png')
   png(outfile, width=400, height=300)
   
   rownames(pf$historicalPF$corrMatrix)<-pf$tickerList
   
   colnames(pf$historicalPF$corrMatrix)<-pf$tickerList
   corrplot(pf$historicalPF$corrMatrix  , type= 'upper' , order = 'hclust' , tl.col = 'black' , tl.srt =45)
   dev.off()
   #img(src="creturn.png")
   list(src = outfile,
        width = 400,
        height = 300,
        alt = "This is alternate text")
   
 },deleteFile=TRUE)
 
 output$hist4<-renderImage({
   pf<-buildNewPortfolio(input$stock,input$date)
   
   ret.mat = listtomat(pf$returnList , pf$tickerList)
   #png("www/creturn.png", width = 400, height = 300)
   outfile <- tempfile(fileext='.png')
   png(outfile, width=400, height=300)
   
   plot.Markowitz(pf$historicalPF$ef , col = 'red' , pch = 22 )
   dev.off()
   #img(src="creturn.png")
   list(src = outfile,
        width = 400,
        height = 300,
        alt = "This is alternate text")
   
 },deleteFile=TRUE)
 
  output$newsitem<-renderText({
    
    if(input$symb=="MS"||input$symb=="ms")
    {
      num<-as.numeric(input$news)
      MSNews[[num]]
    }
    else if(input$symb=="AAPL"||input$symb=="aapl")
    {
      num<-as.numeric(input$news)
      AAPLNews[[num]]
    }
    else if(input$symb=="GOOG"||input$symb=="goog")
    {
      num<-as.numeric(input$news)
      GOOGNews[[num]]
    }
    else if(input$symb=="GS"||input$symb=="gs")
    {
      num<-as.numeric(input$news)
      GSNews[[num]]
    }
    else if(input$symb=="IBM"||input$symb=="ibm")
    {
      num<-as.numeric(input$news)
      IBMNews[[num]]
    }
    else if(input$symb=="TWC"||input$symb=="twc")
    {
      num<-as.numeric(input$news)
      TWCNews[[num]]      
    }
    else if(input$symb=="RIG"||input$symb=="rig")
    {
      num<-as.numeric(input$news)
      RIGNews[[num]]
    }
    else if(input$symb=="VZ"||input$symb=="vz")
    {
      num<-as.numeric(input$news)
      VZNews[[num]]
    }
    else
    {
      num<-as.numeric(input$news)
      GSNews[[num]]
    }
  })
  output$senti <- renderChart({
    if(input$symb=="MS"||input$symb=="ms")
    {
      meta<-meta(score(MSNews))
      
    }
    else if(input$symb=="AAPL"||input$symb=="aapl")
    {
      meta<-meta(score(AAPLNews))
      
    }
    else if(input$symb=="GOOG"||input$symb=="goog")
    {
      meta<-meta(score(GOOGNews))
      
    }
    else if(input$symb=="GS"||input$symb=="gs")
    {
      meta<-meta(score(GSNews))
      
    }
    else if(input$symb=="IBM"||input$symb=="ibm")
    {
      meta<-meta(score(IBMNews))
      
    }
    else if(input$symb=="TWC"||input$symb=="twc")
    {
      meta<-meta(score(TWCNews))
      
    }
    else if(input$symb=="RIG"||input$symb=="rig")
    {
      meta<-meta(score(RIGNews))
      
    }
    else if(input$symb=="VZ"||input$symb=="vz")
    {
      meta<-meta(score(VZNews))
      
    }
    else
    {
      meta<-meta(score(AAPLNews))
      
    }
   # hist(meta[[6]],col="darkgoldenrod1",main="News Sentiment")
   b <- rHighcharts:::Chart$new()
   b$title(text = "Public Sentiment for the Asset")
   b$subtitle(text = input$symb)
   b$data(x = key, y =  meta[[6]], type = "column", name = "Sentiment Factor",color="#fed136")
   return(b)
      
  })
  
  output$sectornewsitem <- renderText({
    if(input$sector==1)
    { 
      num<-as.numeric(input$news1)
      discretionaryNews[[num]]
      
    }
    else if(input$sector==2)
    {
      num<-as.numeric(input$news1)
      staplesNews[[num]]
      
    }
    else if(input$sector==3)
    {
      num<-as.numeric(input$news1)
      energyNews[[num]]
      
    }
    else if(input$sector==4)
    {
      num<-as.numeric(input$news1)
      financialNews[[num]]
      
    }
    else if(input$sector==5)
    {
      num<-as.numeric(input$news1)
      healthNews[[num]]
      
    }
    else if(input$sector==6)
    {
      num<-as.numeric(input$news1)
      industrialNews[[num]]
      
    }
    else if(input$sector==7)
    {
      num<-as.numeric(input$news1)
      technologyNews[[num]]
      
    }
    else if(input$sector==8)
    {
      num<-as.numeric(input$news1)
      materialsNews[[num]]
      
    }
    else if(input$sector==9)
    {
      num<-as.numeric(input$news1)
      telecomNews[[num]]
      
    }
    else
    {
      num<-as.numeric(input$news1)
      utilitiesNews[[num]]
      
    }
    # hist(meta[[6]],col="darkgoldenrod1",main="News Sentiment")
    
    
  })	
    
 output$sectorsenti<-renderChart({
   
   if(input$sector==1)
   {
     meta<-meta(score(discretionaryNews))
     
   }
   else if(input$sector==2)
   {
     meta<-meta(score(staplesNews))
     
   }
   else if(input$sector==3)
   {
     meta<-meta(score(energyNews))
     
   }
   else if(input$sector==4)
   {
     meta<-meta(score(financialNews))
     
   }
   else if(input$sector==5)
   {
     meta<-meta(score(healthNews))
     
   }
   else if(input$sector==6)
   {
     meta<-meta(score(industrialNews))
     
   }
   else if(input$sector==7)
   {
     meta<-meta(score(technologyNews))
     
   }
   else if(input$sector==8)
   {
     meta<-meta(score(materialsNews))
     
   }
   else if(input$sector==9)
   {
     meta<-meta(score(telecomNews))
     
   }
   else
   {
     meta<-meta(score(utilitiesNews))
     
   }
   b <- rHighcharts:::Chart$new()
   b$title(text = "Public Sentiment for Sector")
   b$subtitle(text = "")
   b$data(x = c(1:30), y =  meta[[6]], type = "column", name = "Sentiment Factor",color="#222")
   return(b)
 })
  
  feddata <- getSymbols('DFF', src = "FRED",
                        auto.assign = FALSE)
  feddata<-feddata["2015/"]
  change<-as.numeric(feddata[length(feddata)])-as.numeric(feddata[length(feddata)-1])
  i1<-length(feddata)
  i2<-length(feddata)-1
  while(change==0){
    i1<-i1-1
    i2<-i2-1
    change<-as.numeric(feddata[i1])-as.numeric(feddata[i2])
  }
  output$fed<-renderUI({ 
    
    if(change>0)
    {
      l1<-img(src="bull.png",style="border-radius:100px;")
      l2<-br() 
      l3<-"Positive Outlook"
      l<-list(l1,l2,l3)
      l
    }
    else
    {
      l1<-img(src="bear.png",style="border-radius:100px;")
      l2<-br() 
      l3<-"Cautious Outlook"
      l<-list(l1,l2,l3)
      l
    }
  })
  
  output$op<-renderText({
    
    if(change>0)
    {
      op<-"
The Federal Reserve has decided that the economy is going strong and can take an increase in interest rates. 
Now is probably a good time to be aggressive and chase higher returns."
      op
    }
    else
    {
      op<-"The Federal Reserve has decided that the economy is a bit sluggish and has decreased the interest rates in hopes of boosting the flagging economy.
It's better to take a conservative approach aimed at minimizing risk.  "
      op
    }
    
  })
  
  output$fedplot <- renderPlot({
    
      
    
    chartSeries(feddata, 
                type = "line", log.scale = input$log, TA = NULL, main="Effective Federal Funds Rate")
    
  })
  
  output$plot <- renderPlot({
    data <- getSymbols(input$symb1, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
    
    chartSeries(data, 
                type = "line", log.scale = input$log, TA = NULL)
  })
 
 output$sel <- renderUI({
   w <- ""
   for(i in 1:length(input$equity)) {
     w <- paste(w, numericInput(paste(i), paste(input$equity[[i]], sep = " "), value = input[[sprintf("%d",i)]]))
     w<-paste(w,br())
   }
   HTML(w)
 })
 
 output$mod<-renderPlot({
   #modlist<-c()
   #sum<-0
  # for(i in 1:length(input$equity)) {
   #  modlist<-c(modlist,as.numeric(input[[paste(i)]]))
     
   #}
   t<-c("AAPL","IBM","GS","INTC","MS")
   va<-c(.2642,.2412,.1231,.1486,.2229)
   ret<<-pfReturns.plot(t, input$newdate,va)
 })
 
 #fun<-reactive({
 #  print(paste(ret))
 #})
# output$returns<-renderUI({
#   fun()
 #})
}
  )