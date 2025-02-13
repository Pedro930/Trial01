#Remove objects from workspace
rm(list = ls())

#Added a small cosmetic change


library(readxl)
library(shiny)
library(plotly)
library(reshape2)
library(zoo)

#===================
# Define root of data

source<-"./Data"


#========================
# Import files with data produced by Stata for R database

RfrData<-as.data.frame(read_excel(file.path(source,"Rfr to 20Aug2020.xlsx"), col_names = TRUE))

RfrNew<-reshape(RfrData, v.names = c("Inflation", "Nominal", "Real"), idvar = c("Date"), timevar="Maturity", direction = "wide" )

RfrNew$Date<-as.Date(RfrNew$Date, "%d %b %y")

#========================
#Define lists for pull down menus

date_list <- sort(unique(RfrData[,'Date']))

maturity_list<- sort(unique(RfrData[,'Maturity']))


#========================
#Define long name of assessment gates

#========================
#Specification of formats

label<-list(bgcolor="#f5f2d0", bordercolor="#0066cc")


#Format of fonts and colours
					
f1<-list(
		family="Rileway",
		size=12
		)
		
f2<-list(
		family="Rileway",
		size=18
		)		

f14<-list(
		family="Rileway",
		size=14
		)		
		
				
pal <- c(`Not assessed` = "#FFEAD0", `Fail` = "#E73C6A75",  `Partial pass` = "#3FA7D675", `Pass` = "#59CD9075")



#========================
#shinyApp(ui = ui, server = server)