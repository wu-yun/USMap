
library(maptools)
library(maps)
library(mapdata)
library(RColorBrewer)

getColorParam <- function(stateData,colorspace){
  n <- 6
  mypalette <- brewer.pal(n,colorspace)
  dmin <- min(stateData)-1
  dmax <- max(stateData)
  stateColor <- mypalette[ceiling((stateData-dmin)*n/(dmax-dmin))]
  return (stateColor)
}

getLegendColor <- function(n,colorSpace){
  colors <-c()
  for(i in 1:n){
    colors <-c(colors,brewer.pal(n,colorSpace)[i])
  }
  return (colors)
}



getColor <- function(stateName,stateColor,othercolor){
  tmp <- map('state',plot=FALSE,namesonly = TRUE)
  tmp <- gsub('(:.*)','',tmp)
  # tmp <- match(gsub('(:.*)','',tmp),tolower(stateName))
  f=function(x,y) ifelse(x %in% y, which(y==x),0);
  colIndex = sapply(tmp, f,tolower(stateName));
  color <-c(othercolor,stateColor)[colIndex+1]
  return (color)
}

getLegendText <- function(n,stateData){
  dmax <- max(stateData)
  dmin <- min(stateData)-1
  ltext <- c()
  for(i in 1:n){
    ltext <- c(ltext,format(ceiling((dmax-dmin)/n*(i-1)+dmin),scientific = TRUE,digits = 2))
  }
  return (ltext)
}

plotMap <- function(statename,stateData,maptitle,colorspace){
  statename <- tolower(statename)[stateData!=0]
  stateData <- stateData[stateData!=0]
  stateColor <- getColorParam(stateData,colorspace)
  map('state',col=getColor(statename,stateColor,"white"),fill = TRUE)
  legendtext <- getLegendText(6,stateData)
  legendColor <- getLegendColor(6,colorspace)
  legend("bottom",legend=legendtext,horiz=TRUE, fill=legendColor)
  title(main=maptitle, cex.main=2)
}




