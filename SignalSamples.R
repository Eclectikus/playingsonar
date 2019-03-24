library(caret)
library(mlbench)
data("Sonar")
library(ggplot2)
ggplot(data=training[,60], aes(x=seq(60), y=training[1,seq(60)], color = training$Class))
# Signal by spectral sample
install.packages('ggthemes', dependencies = TRUE)
library("ggthemes")
for (j in 1:157) {  # loop observations
      Xvalues <- as.data.frame(1:60)
      Yvalues <- as.data.frame(t(training[j,1:60])) # transpose, row to column
      Signal <- cbind(Xvalues,Yvalues) # two-columns data for observation 'j'
    colnames(Signal) <- c("Spectral sample", "Normalized energy")
    a <- ggplot(data = Signal, aes(x = Xvalues, y = Yvalues, coord_fixed()))
    a <- a + geom_line(lty = 1, color = "gray", size = 0.3, na.rm = TRUE)
    a <- a + xlab("Spectral sample") + ylab("Normalized energy") 
    a <- a + ggtitle("Signal by spectral sample")
    a <- a + theme_solarized(light = FALSE) + scale_colour_solarized("blue")
    # a <- a + theme_base() + scale_colour_few()
    a <- a + xlim (0,60) + ylim(0,1)
        ## outcomes by color
          if (training[j,61] == "M") {
              ColorCode <- "blue"
              outcome <- "Mine"
          }
          else {
              ColorCode <- "orange"
              outcome <- "Rock"
          }
    a <- a + annotate("text", x = 5, y = 0.92, label = outcome , colour = ColorCode, size = 5.4)
    a <- a + annotate("text", x = 55, y = 0.92, label = paste("Return", j),
                      colour = "gray", size = 4.5)
    blue.bold.text <- element_text(face="bold", color="white")
    a <- a + theme(axis.title = blue.bold.text, legend.position="none")
    a <- a + geom_point(size = 1.5, color = ColorCode)
    a <- a + geom_smooth(fill = ColorCode, color = ColorCode, size = 0.75,
                         alpha = 0.30, na.rm = TRUE)
    ## plot to file
      WD0 <- "C:/MyDATA/Routput/SONAR2"
      filename=paste("S",j,".png",sep="")
      ggsave(filename, plot = a, path = WD0, width = 16, height = 9, dpi = 120)
      print(a)
}