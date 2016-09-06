---
layout: post
title:  "Classical MVC Module Event mechanism"
date:   2016-05-06
img: /img/blog/MVC-flow-diagram.png
category: Design
tags: [mvc, oop, feature]
---
MVC was always a hype since the years 70’, and hexMachina also have a classical implementation for this actitectural pattern. Let’s see how it looks like in practice.

In this article my goal is not to to explain the principles of MVC, but more to describe the implementation and typical usage of it in hexMachina.

<h3>MVC flow diagram</h3>
![MVC Flow diagram]({{ site.baseurl }}/img/blog/MVC-flow-diagram.png)
<h3>Explanation</h3>

Before anyone would get scared of 11 steps of chain let me explain it in details. :)

First we need to understand the 5 layers: - Model - View - Controller - Service locator - Front contoller

<h3>MODEL</h3>

It’s the well known Model layer, that represents the state of your application. Here we store data and represent it in different forms (let’s just think about a timestamp of a birthdate and representing it in different styles:date of birth, days passed, age, etc). Many times we use VOs (ValueObjects) to store the corresponding data, this way it’s easier to manage them together.

<h3>VIEW</h3>

The View layer split into 3 parts:

<h3>UI (UserInterface)</h3>

This layer is the native user interface. For example, in case of JS out, this is the html layer. This is normally absolutely passive and just hang and wait to be managed

<h3>View</h3>

This is the layer, that manages the UI layer directly. Set’s it’s coordinates or modify it’s visual parameters, listens to it’s native events, etc. This layer normally implements an IConcreteView interface, and through it the ViewHelper can communicate with this layer. It’s pretty useful if you have multiple targets, or multiple visual implementation with the same functionality.

<h3>ViewHelper</h3>

This layer fills the mediator role between the MVC structure and the View itself. It transform for example the click events to concrete business requests (like load a picture), and it converts the business information to a simple data for the view, that it can represent after. Also it managed the main manipulations of the view, so it also acts like a helper, to manage the view itself.

<h3>Controller</h3>

In the controller layer we we use command pattern to ensure noone tries to store any state here. We have basically two type of commands: - BasicCommand. That is a synchronous command - AsyncCommand. Usage is normally the same, but it can wait any async call’s result, and after manage it. Uppon on the commands there is an extra layer, that we call Macro. These Macros are able to run a series of commands, so this way if you need to chain a lot of commands for an action, Macros are the right tools for doing it.

<h3>Service locator</h3>

The Service locator is responsible to provide the API of the injected services inside the modules. Because we always put service implementations outside of the modules, we need a service locator, that can provide us the correct service insances when ie a Command want to inject them and use throug it’s interface. Inside this layer we can find two types of services: - StatefulService (ie. WebSocket) - StatelessService (ie. Http)

<h3>Front controller</h3>

Let’s say the Front controller is the heart of a module. Here you normally don’t write any business logic, but this is the layer that is responsible to fire the commands through CommandExecutor, and this layer reacts to the events of the privateDispatcher of the Module.

<h3>Example flow</h3>

So now as we have an overview of the different layers of the module, take an example event flow, that after you can follow on the above diagram.

Let’s imagine we have a gallery application and for a click event we need to load a new random picture from a Service. What should we do for this?

The user triggers with his mouse a native HTMLEvent.CLICK on the image UI (in our case let’s assume he clicks on the image).
We catch this natvie event in our GalleryView and forward this information as an abstract ImageViewMessage.CLICK (that we implemented, so it’s independent from the platform that we use).
The GalleryViewHelper catch this message and forward as a business request GalleryMessage.LOAD_IMAGE to the privateDispatcher.
The FrontControlle runs the previously mapped LoadGalleryImageMacro for this message. Inside the Macro it runs through it’s mapped commands.
The LoadRandomImageAsyncCommand calls the RandomImageStatelessService and tells to it to load a new random image.
The RandomImageStatelessService notifies the LoadRandomImageAsyncCommand about it’s done.
The LoadGalleryImageMacro goes to the second UpdateGalleryImageCommand, using the output of the previous AsyncCommand. And this command stores the new url information the the GalleryModel
As the GalleryMdel gets the new url, it immediately notifies it’s listeners about the change. So the GalleryViewHelper is notified about the change.
The GalleryViewHelper tells the GalleryView to load the new image url.
The GalleryView sets the src parameter of the image UI, so we have the new image.
Huh, we’ve survived! :) So yes, as you see, there are a lot of steps, and we’ve heard a lot of times the typical question: Why do I need to make a lot of classes to just change an image? But if someones has ever experienced problems of code reuse, refactoring, testability, single responsibility, etc… so then he knows the answer, why… :)



_Later in a different posts, you can read more detailed information about the responsibilities of the layers, and it’s tools. The goal was now to give an overview of the system parts and the communication between them.