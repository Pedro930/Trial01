
server <- function(input,output) { 

output$Yields <-renderPlotly({
								
								MAReal5=rollmean(RfrNew$Real.5,input$Length[2], fill=NA, align="left")
								MAReal10=rollmean(RfrNew$Real.10,input$Length[2], fill=NA, align="left")
								MAReal20=rollmean(RfrNew$Real.20,input$Length[2], fill=NA, align="left")

								PlotData<-data.frame(cbind(RfrNew$Date, MAReal5, MAReal10, MAReal20))
								
								plot<-plot_ly(PlotData, x=~RfrNew$Date, y=~MAReal20, type = 'scatter', name="20 years", mode='line') %>% layout(
									xaxis = list(title=""),
									yaxis = list(title="")
									)
									
								plot <- plot %>% add_trace(x=~RfrNew$Date, y=~MAReal10, type = 'scatter', name="10 years", mode='line')

								plot <- plot %>% add_trace(x=~RfrNew$Date, y=~MAReal5, type = 'scatter', name="5 years", mode='line')
								
								plot
						  })


}
