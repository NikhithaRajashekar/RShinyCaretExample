library(shiny);

shinyUI(pageWithSidebar(
  headerPanel("Caret R Shiny Example"),
  sidebarPanel(fileInput('rawInputFile','Upload Data File',accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
               checkboxInput('headerUI','Header',TRUE),
               radioButtons('sepUI','Seperator',c(Comma=',',Semicolon=';',Tab='\t'),'Comma'),
               radioButtons('quoteUI','Quote',c(None='','Double Quote'='"','Single Quote'="'"),'Double Quote')
    ),
   mainPanel(
     tabsetPanel(
       tabPanel("modelSelectionUI",radioButtons("crossFoldTypeUI","Cross Validation Type",c('No CV'=0,"K-Fold CV"=1,"Repeated KFold CV"=2),"K-Fold CV"),
                                  uiOutput("CVTypeUI"),
                                  radioButtons("preprocessingUI","Pre-processing Type",c('No Preprocessing'=0,'PCA'=1,'ICA'=2),'No Preprocessing'),
                                  uiOutput("ppUI"),
                                  selectInput("modelSelectionUI",
                                              c("Generalized Linear Model"="lm","Elastic Net"="en","Neural Network"="nn",
                                                "Random Forest"="rf","Support Vector Machine"="svm"),"Generalied Linear Model"),
                                  uiOutput("modelUI"),
                                  uiOutput("labelSelectUI")),
       tabPanel("Data View",uiOutput("dataSelectorUI"),dataTableOutput("rawDataView"))))))