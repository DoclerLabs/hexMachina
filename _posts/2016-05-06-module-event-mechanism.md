---
published: true
layout: post
title: Classical MVC Module Event mechanism
---
MVC was always a hype since the years 70', and hexMachina also have a classical implementation for this actitectural pattern. Let's see how it looks like in practice.

_In this article my goal is not to to explain the principles of MVC, but more to describe the implementation and typical usage of it in hexMachina._

## MVC flow diagram
<a href="/images/hexMachina_Module_Flow_Diagram.png" target="_blank">![Module Flow Diagram]({{site.baseurl}}/images/hexMachina_Module_Flow_Diagram.png)</a>

## Explanation
Before anyone would get scared of 11 steps of chain let me explain it in details.  :)

First we need to understand the 5 layers:
- Model
- View
- Controller
- Service locator
- Front contoller

### MODEL

It's the well known Model layer, that represents the state of your application. Here we store data and represent it in different forms (let's just think about a timestamp of a birthdate and representing it in different styles:date of birth,  days passed, age, etc).
Many times we use VOs (ValueObjects) to store the corresponding data, this way it's easier to manage them together.

### VIEW

The View layer split into 3 parts:

#### UI (UserInterface)
This layer is the native user interface. For example, in case of JS out, this is the html layer. This is normally absolutely passive and just hang and wait to be managed

#### View
This is the layer, that manages the UI layer directly. Set's it's coordinates or modify it's visual parameters, listens to it's native events, etc. This layer normally implements an IConcreteView interface, and through it the ViewHelper can communicate with this layer. 
It's pretty useful if you have multiple targets, or multiple visual implementation with the same functionality.

#### ViewHelper
This layer fills the mediator role between the MVC structure and the View itself.
It transform for example the click events to concrete business requests (like load a picture), and it converts the business information to a simple data for the view, that it can represent after.
Also it managed the main manipulations of the view, so it also acts like a helper, to manage the view itself.

#### Controller



_Later in a different post, you can read more detailed information about the responsibilities of the layers, and it's tools. The goal was now to give an overview of the system parts and the communication between them.
