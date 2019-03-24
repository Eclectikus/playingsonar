---
title: "Sonar Info"
author: "Joanh"
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
|57  | 0.0152| 0.0102| 0.0113| 0.0263| 0.0097| 0.0391| 0.0857| 0.0915| 0.0949| 0.1504|
|18  | 0.0192| 0.0607| 0.0378| 0.0774| 0.1388| 0.0809| 0.0568| 0.0219| 0.1037| 0.1186|
|93  | 0.0260| 0.0192| 0.0254| 0.0061| 0.0352| 0.0701| 0.1263| 0.1080| 0.1523| 0.1630|
|166 | 0.0221| 0.0065| 0.0164| 0.0487| 0.0519| 0.0849| 0.0812| 0.1833| 0.2228| 0.1810|
|64  | 0.0067| 0.0096| 0.0024| 0.0058| 0.0197| 0.0618| 0.0432| 0.0951| 0.0836| 0.1180|
|108 | 0.0428| 0.0555| 0.0708| 0.0618| 0.1215| 0.1524| 0.1543| 0.0391| 0.0610| 0.0113|

```
## [1] "kable(head(Sonar[h, 52:61]), format = 'markdown')"
```



|    |    V52|    V53|    V54|    V55|    V56|    V57|    V58|    V59|    V60|Class |
|:---|------:|------:|------:|------:|------:|------:|------:|------:|------:|:-----|
|57  | 0.0049| 0.0041| 0.0036| 0.0013| 0.0046| 0.0037| 0.0011| 0.0034| 0.0033|R     |
|18  | 0.0331| 0.0131| 0.0120| 0.0108| 0.0024| 0.0045| 0.0037| 0.0112| 0.0075|R     |
|93  | 0.0118| 0.0120| 0.0051| 0.0070| 0.0015| 0.0035| 0.0008| 0.0044| 0.0077|R     |
|166 | 0.0089| 0.0051| 0.0015| 0.0075| 0.0058| 0.0016| 0.0070| 0.0074| 0.0038|M     |
|64  | 0.0048| 0.0023| 0.0020| 0.0040| 0.0019| 0.0034| 0.0034| 0.0051| 0.0031|R     |
|108 | 0.0142| 0.0179| 0.0079| 0.0060| 0.0131| 0.0089| 0.0084| 0.0113| 0.0049|M     |


## Physical base

### Sonar, Mines vs. Rocks
[Via UBC](http://ugrad.stat.ubc.ca/R/library/mlbench/html/Sonar.html)

This is the data set used by Gorman and Sejnowski in their study of the classification of sonar signals using a neural network [**1**]. The task is to train a network to discriminate between sonar signals bounced off a metal cylinder and those bounced off a roughly cylindrical rock.

Each pattern is a set of 60 numbers in the range 0.0 to 1.0. Each number represents the energy within a particular frequency band, integrated over a certain period of time. The integration aperture for higher frequencies occur later in time, since these frequencies are transmitted later during the chirp.

The label associated with each record contains the letter "R" if the object is a rock and "M" if it is a mine (metal cylinder). The numbers in the labels are in increasing order of aspect angle, but they do not encode the angle directly.

[**1**]. Gorman, R. P., and Sejnowski, T. J. (1988). "Analysis of Hidden Units in a Layered Network Trained to Classify Sonar Targets" in Neural Networks, Vol. 1, [pp. 75-89](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.299.8959&rep=rep1&type=pdf). Same authors almost a year later published: [Learned Classification of Sonar Targets Using a Massively Parallel Network](https://papers.cnl.salk.edu/PDFs/Learned%20Classification%20of%20Sonar%20Targets%20Using%20a%20Massively%20Parallel%20Network%201988-3231.pdf).



### Sonar data and signal representation
From reference [**1**]

The data used for the network experiments were sonar returns collected from a metal cylinder and a cylindrically shaped rock positioned on a sandy ocean floor. Both targets were approximately 5 ft in length and the impinging pulse was a wide-band linear FM [chirp](https://en.wikipedia.org/wiki/Chirp) (ka = 55.6). Returns were collected at a range of 10 meters and obtained from the cylinder at aspect angles spanning 90 
