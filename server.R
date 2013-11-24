library(shiny);

shinyServer(function(input,output)
{
  
  rawInputData = reactive({
    rawData = input$rawInputFile
    
    headerTag = input$headerUI;
    
    sepTag = input$sepUI;
    
    quoteTag = input$quoteUI;

    
    if(!is.null(rawData)) {
      data = read.csv(rawData$datapath,header=headerTag,sep=sepTag,quote=quoteTag);
    } else {
      return(NULL);
    }
    
  });
  
  output$rawDataView = renderDataTable({
    newData = rawInputData();
    if(is.null(newData))
      return();
    newData;
  });
  
  output$dataSelectorUI = renderUI({
    return();
  });
  
  
});