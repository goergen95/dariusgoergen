---
title: "Machine Learning to classify microplastic particles"
layout: post
date: 2019-10-22 13:43
tag: 
 - machine learning
 - microplastics
 - cnn
 - FTIR-Spectrometry
headerImage: false
hidden: false # don't count this post in blog pagination
description: "Classification of Fourier-Transform Spectra to classify microplastics."
projects: true
category: project
author: darius
externalLink: false
---

![Probe Seperators](../assets/images/seperators.jpg)<br>
*Photo of two sediment separators taken by Sarah Brüning*

### What is it about?

Microplastic particles in the environment are an ever growing concern in the public
and in science. It is suspected not only to pose threats on wildlife but also
concerns for the human health have been raised. Scientists and especially decision 
makers depend on the availability of precise and timely information on the 
where and whens of microplastic in the environment. The process of spectral 
identification of particles, however, remains a cost intensive process requiring 
humans to invest time and effort into the correct identification of spectra. 
Modern machine learning techniques have the potential to decrease the necessity 
of human intervention in the classification process and thus significantly speed 
up the complete process from taking environmental samples to communicate the results
to the public. 

### What it can do!

Based on a freely available reference data base published by [Primpke and colleagues](https://link.springer.com/article/10.1007/s00216-018-1156-x)
I developed a decision fusion algorithm based on two Random Forest models and 
two Convolutional Neural Networks which together are able to robustly identify
polymers based on FTIR-spectral data. The complete workflow is reproducible and 
adjustable and consists of the following stages: preparation of a reference data base,
exploration of machine learning models and pre-processing techniques, calibration
of the final decision fusion algorithm, and classification of real-world spectral
samples. The algorithm was written in R and the code is available on a [GitHub
repository](https://github.com/goergen95/polymeRID). Additionally, there is
a [workflowr website](https://goergen95.github.io/polymeRID/index.html) communicating the structure of the algorithm and the 
results based on the mentioned OpenSource data base.

---

Here you can explore the spectral reference data base based on selected polymers 
and other materials commonly found in environmental samples. Simply choose a class 
you wish to display and explore its spectral charachteristics. 

<iframe src="https://goergen95.shinyapps.io/shiny_apps/?showcase=0" width="100%" height="500px"></iframe>
