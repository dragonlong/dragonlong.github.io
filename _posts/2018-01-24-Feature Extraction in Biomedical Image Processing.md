---
layout: post
title: Feature Extraction in Biomedical Image Processing
date: 2018-01-24
---
![My helpful screenshot]({{ "/assets/self.JPG" | absolute_url }})
Here we try to look into the feature extraction problem in biomedical image processing, common ways have been explored here.

1. Map into another domain by transform, like trace transform:
   by changing polar coordinates into x-y coordinate, we could map the pixel value into a different organization, here trace transform is a little bit different, for the same (/phi, p), we don't use the pixel value, but integrate the pixel values along the trace line. Different trace functional bring in different weighting functionals, thus helping find the necessary invariant features. 
