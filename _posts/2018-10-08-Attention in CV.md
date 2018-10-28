---
layout: post
title: Attention Mechanism in Video Processing
date: 2018-10-08
---
![My helpful screenshot]({{ "/assets/self.JPG" | absolute_url }})

* higher level CV challenges, intuition;
1. where to look at, is actually the best way to filter noise and refine the model performance;
Given a word(or something else), where you should look at? Certainly we have those detection networks based on feature activations for different objects. A visual attention mechanism enables the model to focus on the most relevant regions of input to extract more discriminative features.

Given something you already seen in previous frame, where you should look into in next frame?
Features are extract from a lower convolutional layer, and the decoder will selectively focus on certain
parts of the image by weighting a subset of all the feature vectors
a lot of methods could solve the problem where the objects are, by training special features activation
in supervised learning, or doing classification through ROI region proposal, some of them could focus on
some salient region in the image by local-feature contrast(saliency detectors), however, they look at the whole image. In stead of looking to the whole image, attention model would help focus on a small region. How this is achieved when the labels are not direct given?
Several attention papers tries to look into this by using their
problem formulation.
For the paper show, attend and tell:
Given images as input, we want to build a model to generate image captions automatically. So how to get data flow from images to sentences? A general way is to detect objects, understand relationship, and then trying to composite the sentences. However, if only the sentences are available, no image detections ground-truth, we will actually want to establish the mapping directly from images sentences,
instead of image detections to sentences. We first establish the words as one-hot vectors to generate, the image could be processed into feature map, vectors across channels could further stand for latent features standing for features of object at that location(receptive field size), if in every step, we could let the system looking into corresponding region of the image, i.e. assign weights to feature vectors at different
locations, followed by mapping from selected features to corresponding words.  Since every word not only depends on the feature vectors, but also relates to words predicted on previous frames, so a LSTM model is desirable here to go over different regions sequentially.
The objective is to fix the feature extractor, and deep output layer, but get transformation W to assign weights to feature vectors at different locations based on previous word output and all feature vectors.
So how to attend? s is latent variable, (s_t,i) time t, location i, the indicator function. s_1, s_2, s_3
could be random, sequential y would generated,
For the Recurrent Models of Visual attention: It seems they could go over different regions to attend
sequentially using RNN, they also have Gaussian distribution sampling, and glimpse network to extract
retina-like features;
Now we could try to find more on Attention video: how to automatically look into regions for the
same object? Is this attention happening on global context level, or just local patches? How to
leverage context informations?
#
We want to know:
1. how spatial & temporal attention could help improve MOT tracking?<select regions from features of the targets by weighting>
In [1], temporal attention is used to balance the relative importance between current and historical visual cues based on occlusion status when updating the appearance model. For some extreme cases where part of the object is occluded, spatial
attention would help weight the whole ROI feature map, so the same object could be tracked and still give higher track score to the correct detection box, their special CNN branch with spatial map integrated just help with box selection, but the boxes are coming from Gaussian sampling centered at predicted box location by motion model. We don't want the occlusion object drift current appearance, so temporal attention model will output weights on loss from positive samples at current frame and historical frames, so the appearance model could be always tightly associated to correct object features.
In [2], they also use the dual-attention mechanism, but it's more close to the original attention paper, it considers feature map as feature vectors in different locations, but the attention comes from cross similarity instead of recurrent
way. Their temporal attention model is more like a global optimization to filter out unreliable samples in the trajectory.
2. how are attention model designed and trained?
Given visibility map and overlap status,
3. Would it help with text detection to improve the accuracy?
Both spatial and temporal attention are used here to help with tracking. In this paper, the attention module helps the system look at good features of the correct object both spatially(in one frame) and temporally(tracking across frames). We don't really need to make it so complex, but we could propose target locations based on motion model, and combine it with off-line detections, so and then we try to select boxes based on transformed features. But the key question is how we could generate new predicted boxes? Transformation!!! We will use the spatial transformer on every targets as attention module to get discriminative appearance cues, while also generate affine transform. Attention model and ROI pooling would help the boxes selection and updating. Each target's state would be managed by a simple threshold, or we could use MDP for better decision.
[1]. Online Multi-Object Tracking Using CNN-based Single Object Tracker with Spatial-Temporal Attention Mechanism
[2]. Online Multi-Object Tracking with Dual Matching Attention Networks
[3]. Tracking by Animation: Unsupervised Learning of Multi-Object Attentive Trackers
* the methodology and framework;

* Practice, Examples, advantages and limitations;
In this dual-matching MOT paper, it focuses on the feature map channels extracted from an image patch, starting from 7*7*2048-channel based on the image pairs(how pairs are generated), if we want to better compute the similarity score, we need to align feature vector across channels at different pixel location, higher score gives better localization. Attention map by dual matching would compute
* Limitations and New potential(New tendencies);
