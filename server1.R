shinyServer(function(input,output,session){
  
  
  output$totalSentiment<-renderText({
    
    if(input$symb=="ola"||input$symb=="OLA")
    {
      (mean(meta(score(olanews))[[5]]))*1000
    }
    else
    {
      (mean(meta(score(ubernews))[[5]]))*1000
    }
  })
  
  output$leadershipScore<-renderChart({
    
    i<-1
    for(person in olafounders)
    {
      #scores the education
      educationScore<-((person$education.level)/
                         (person$education.brand ))*(person$education.relevance ) #relevance, brand - keep from 0.1 to 1
      
      workScore<-0
      for(job in person$education.experience)
      {
        #scores the work experience
        workScore<- workScore + (((job['years']/job['brand'])/job['role'])*job['relevance'])
      }
      
      compositeScore<- educationScore + workScore;
      leaders[[i]]<-compositeScore
      i<-i+1
    }
    
    
    b <- rHighcharts:::Chart$new()
    b$title(text = "Leadership Score")
    b$subtitle(text = input$symb)
    b$data(x = leadershipkey, y =  leaders, type = "column", name = "Leadership Score",color="#100146")
    return(b)
    
  })
  
  output$marketshare <- renderGvis({
    gvisGeoChart(ubergeo, locationvar="Country", 
                 colorvar="Share",options=list(colors="['#cbb69d', '#603913', '#c69c6e']"))     
  })
  
  output$sentimentgauge <- renderGvis({
    
    if(input$symb=="ola"||input$symb=="OLA")
    {
      popularity<-(mean(meta(score(olanews))[[5]]))*1000
    }
    else
    {
      popularity<-(mean(meta(score(ubernews))[[5]]))*1000
    }
    compPop<-data.frame(company= input$symb, popularity=popularity)
    
    gvisGauge(compPop, 
              options=list(min=0, max=100, greenFrom=66,
                           greenTo=100, yellowFrom=33, yellowTo=66,
                           redFrom=0, redTo=33, width=100, height=100))     
  })
  
  output$marketScore<-renderText({
    
    i<-1
    for(person in olafounders)
    {
      #scores the education
      educationScore<-((person$education.level)/
                         (person$education.brand ))*(person$education.relevance ) #relevance, brand - keep from 0.1 to 1
      
      workScore<-0
      for(job in person$education.experience)
      {
        #scores the work experience
        workScore<- workScore + (((job['years']/job['brand'])/job['role'])*job['relevance'])
      }
      
      compositeScore<- educationScore + workScore;
      leaders[[i]]<-compositeScore
      i<-i+1
    }
    
    
    b <- rHighcharts:::Chart$new()
    b$title(text = "Leadership Score")
    b$subtitle(text = input$symb)
    b$data(x = leadershipkey, y =  leaders, type = "column", name = "Leadership Score",color="#100146")
    return(b)
    
  })
  
  output$newsitem<-renderText({
    
    if(input$symb=="ola"||input$symb=="OLA")
    {
      num<-as.numeric(input$news)
      content(olanews[[num]])
    }
    else
    {
      num<-as.numeric(input$news)
      content(ubernews[[num]])
    }
  })
  output$senti <- renderChart({
    if(input$symb=="OLA"||input$symb=="ola")
    {
      meta<-meta(score(olanews))
      key<-1:4
    }
    else
    {
      meta<-meta(score(ubernews))
      key<-1:10
    }
    
    # hist(meta[[6]],col="darkgoldenrod1",main="News Sentiment")
    b <- rHighcharts:::Chart$new()
    b$title(text = "Public Sentiment for the Startup")
    b$subtitle(text = input$symb)
    b$data(x = key, y =  meta[[5]], type = "column", name = "Sentiment Factor",color="#fed136")
    return(b)
    
  })
  
  
  
  #fun<-reactive({
  #  print(paste(ret))
  #})
  # output$returns<-renderUI({
  #   fun()
  #})
    }
)