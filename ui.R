ui <- fluidPage(

	#theme=shinytheme("readable"),
	
		
	navbarPage("Charts",
		
		tabPanel("Yield from British Government Securities (Real Zero Coupon) ",
			
			fluidRow(
				
				column(8, sliderInput(					
								inputId = "Length",
								label = "Length of trailing average",
								min = 0, max = 360,
								sep = "",
								value = c(0,360),
								step = 20
				)
						
			),

			fluidRow(
				column(12, plotlyOutput("Yields"))
			)
		)
	)
	
)
)