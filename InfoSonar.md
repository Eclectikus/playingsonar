---
title: "Sonar Info"
author: "Eclectikus"
date: "2016"
output:
    html_document:
      toc: true
      toc_float: true
      fig_caption: true
      code_folding: hide
      keep_md: true
---
# Playing with Sonar {mlbench}

A bit of gymnastics in [RStudio](https://www.rstudio.com/), [R Markdown](http://rmarkdown.rstudio.com/) and [knitr](https://cran.r-project.org/web/packages/knitr/index.html).

**knitre** quick reference: [knitr in a knutshell](http://kbroman.org/knitr_knutshell/) - [Author's site](http://yihui.name/knitr/)

---

**mlbench**: Machine Learning Benchmark Problems -[CRAN](https://cran.r-project.org/web/packages/mlbench/index.html)- A collection of artificial and real-world machine learning benchmark problems, including, e.g., several data sets from the UCI repository.

Usage (remember install library first: `install.packages("mlbench")`)
```
library(mlbench)
data("Sonar")
```
Format:

> A data frame with 208 observations on 61 variables, all numerical and one (the Class) nominal.

Below a sample of this data frame (`b <- sample(c(1:208), size = 9, replace = FALSE, prob = NULL)`)


```
## [1] "kable(head(Sonar[b, 1:10]), format = 'markdown')"
```



|    |     V1|     V2|     V3|     V4|     V5|     V6|     V7|     V8|     V9|    V10|
|:---|------:|------:|------:|------:|------:|------:|------:|------:|------:|------:|
|29  | 0.0100| 0.0275| 0.0190| 0.0371| 0.0416| 0.0201| 0.0314| 0.0651| 0.1896| 0.2668|
|13  | 0.0079| 0.0086| 0.0055| 0.0250| 0.0344| 0.0546| 0.0528| 0.0958| 0.1009| 0.1240|
|196 | 0.0129| 0.0141| 0.0309| 0.0375| 0.0767| 0.0787| 0.0662| 0.1108| 0.1777| 0.2245|
|197 | 0.0050| 0.0017| 0.0270| 0.0450| 0.0958| 0.0830| 0.0879| 0.1220| 0.1977| 0.2282|
|7   | 0.0317| 0.0956| 0.1321| 0.1408| 0.1674| 0.1710| 0.0731| 0.1401| 0.2083| 0.3513|
|164 | 0.0072| 0.0027| 0.0089| 0.0061| 0.0420| 0.0865| 0.1182| 0.0999| 0.1976| 0.2318|

```
## [1] "kable(head(Sonar[h, 52:61]), format = 'markdown')"
```



|    |    V52|    V53|    V54|    V55|    V56|    V57|    V58|    V59|    V60|Class |
|:---|------:|------:|------:|------:|------:|------:|------:|------:|------:|:-----|
|29  | 0.0088| 0.0104| 0.0036| 0.0088| 0.0047| 0.0117| 0.0020| 0.0091| 0.0058|R     |
|13  | 0.0176| 0.0127| 0.0088| 0.0098| 0.0019| 0.0059| 0.0058| 0.0059| 0.0032|R     |
|196 | 0.0124| 0.0093| 0.0072| 0.0019| 0.0027| 0.0054| 0.0017| 0.0024| 0.0029|M     |
|197 | 0.0165| 0.0056| 0.0010| 0.0027| 0.0062| 0.0024| 0.0063| 0.0017| 0.0028|M     |
|7   | 0.0201| 0.0248| 0.0131| 0.0070| 0.0138| 0.0092| 0.0143| 0.0036| 0.0103|R     |
|164 | 0.0078| 0.0071| 0.0081| 0.0034| 0.0064| 0.0037| 0.0036| 0.0012| 0.0037|M     |


## Physical base

### Sonar, Mines vs. Rocks
[Via UBC](http://ugrad.stat.ubc.ca/R/library/mlbench/html/Sonar.html)

This is the data set used by Gorman and Sejnowski in their study of the classification of sonar signals using a neural network [**1**]. The task is to train a network to discriminate between sonar signals bounced off a metal cylinder and those bounced off a roughly cylindrical rock.

Each pattern is a set of 60 numbers in the range 0.0 to 1.0. Each number represents the energy within a particular frequency band, integrated over a certain period of time. The integration aperture for higher frequencies occur later in time, since these frequencies are transmitted later during the chirp.

The label associated with each record contains the letter "R" if the object is a rock and "M" if it is a mine (metal cylinder). The numbers in the labels are in increasing order of aspect angle, but they do not encode the angle directly.

[**1**]. Gorman, R. P., and Sejnowski, T. J. (1988). "Analysis of Hidden Units in a Layered Network Trained to Classify Sonar Targets" in Neural Networks, Vol. 1, [pp. 75-89](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.299.8959&rep=rep1&type=pdf). Same authors almost a year later published: [Learned Classification of Sonar Targets Using a Massively Parallel Network](https://papers.cnl.salk.edu/PDFs/Learned%20Classification%20of%20Sonar%20Targets%20Using%20a%20Massively%20Parallel%20Network%201988-3231.pdf).



### Sonar data and signal representation
From reference [**1**]

The data used for the network experiments were sonar returns collected from a metal cylinder and a cylindrically shaped rock positioned on a sandy ocean floor. Both targets were approximately 5 ft in length and the impinging pulse was a wide-band linear FM [chirp](https://en.wikipedia.org/wiki/Chirp) (ka = 55.6). Returns were collected at a range of 10 meters and obtained from the cylinder at aspect angles spanning 90 � and from the rock at aspect angles spanning 180 �.

<p align="center">![Network aequitecture and typical signal](figures/PhysicsSchemw.png)</p>

A set of 208 returns (111 cylinder returns and 97 rock returns) were selected from a total set of 1200 returns on the basis of the strength of the specular return (4.0 to 15.0 dB signal-to-noise ratio). An average of 5 returns were selected from each aspect angle. Figure 2 shows a sample return from the rock and the cylinder. The preprocessing of the raw signal was based on experiments with human listeners (Gorman & Sawatari, 1987). The temporal signal was first filtered and spectral information was extracted and used to represent the signal on the input layer.

<p align="center">![Sonar signal](figures/SonarSignal.png)</p>

The preprocessing used to obtain the spectral envelope is indicated schematically in Figure 3 where a set of sampling apertures (Figure 3a) are superimposed over the 2D display of a [short-term Fourier Transform](https://en.wikipedia.org/wiki/Short-time_Fourier_transform) spectrogram of the sonar return. As shown in Figure 3b and c, the spectral envelope, P,0,v0(~), was obtained by integrating over each aperture. The spectral envelope was composed of 60 spectral samples, normalized to take on values between 0.0 and 1.0. (See Gorman & Sejnowski, 1987 for a detailed treatment of the preprocessing).

## Exploratory amusements

After loading libraries and data,


```r
## Libraries&data
    library(mlbench)
    library(ggplot2)
    library(ggthemes)
    library(caret)
    library('knitr')
    data("Sonar")
```

and creating training and testing sets,


```r
## Train&test
  set.seed(107)
  inTrain <- createDataPartition(y = Sonar$Class, p = .75, list = FALSE)
  training <- Sonar[ inTrain,]
  testing <- Sonar[-inTrain,]
```

I made a quick approach to data by running a few graphical routines on previous, arbitrary, training set. 


```r
# 
for(i in names(training)){   # loop columns
  a <- ggplot(data = training, aes(training[,i],y = Class, coord_fixed(),
                                   col = Class))
  a <- a + geom_point(size=3)
  a <- a + xlab("Signal") + ylab("Mine or Rock") 
  a <- a + ggtitle("Signal by spectral sample and outcome (mine or rock)")
  a <- a + theme_solarized(light = FALSE)+scale_colour_solarized("blue")
  a <- a + xlim(0,1)
  a <- a + annotate("text", x = 0.50, y = 1.2, label = "Mine", colour = "white")
  a <- a + annotate("text", x = 0.50, y = 2.2, label = "Rock", colour = "white")
  a <- a + annotate("text", x = 0.94, y = 2.4, label = i, colour = "yellow", size = 7.5)
                    blue.bold.text <- element_text(face="bold", color="white")
  a <- a + theme(axis.title = blue.bold.text, legend.position="none")
## plot to file
WD0 <- "C:/MyDATA/Routput/SONAR1"   # (use your local disk)
filename=paste(i,".png",sep="")
ggsave(filename, plot = a, path=WD0,width = 16, height = 9, dpi = 120)
print(a)
}
```

![*Signal by spectral sample and "outcome" (mine or rock)*](http://i.imgur.com/OLzwGGr.gif)

And also,


```r
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
      WD0 <- "C:/MyDATA/Routput/SONAR2"   # (use your local disk)
      filename=paste("S",j,".png",sep="")
      ggsave(filename, plot = a, path = WD0, width = 16, height = 9, dpi = 120)
      print(a)
}
```

![*Signal by return and "outcome" (mine or rock)*](http://i.imgur.com/mJt8gcd.gif)

[I tried first to do the above animations directly from R by using package `animation` (from the same author as `knitre`), but got nothing, surely I need more time. [Its Github](https://github.com/yihui/animation) and [Its site](http://yihui.name/animation/) are sure the starting points. After that I tried [Gimp](https://www.gimp.org/) but the poor quality made me desist. So finally I happily used [ezgif.com](http://ezgif.com/)]


