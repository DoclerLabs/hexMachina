---
layout: post
title:  "IAnnotationReplace - use constant in annotation"
image: /img/blog/hexmachina-welcome.jpg
category: News
tags: [release, annotation]
---
Let's highlight one new feature on release `0.21.0`. 

### IAnnotationReplace

Utility interface that allows you to replace expressions in annotation with their values. It's especially handy for keeping injection names in classes with constants.

Build macro attached to `IAnnotationReplace` will cause following change:

```haxe
@Inject(MyConstants.NAME_ONE)
public var injectedOne:String;
```

becomes

```haxe
@Inject("one")
public var injectedOne:String;
```

Expressions that are already constants will remain untouched so `@Inject("one")` will stay the same. That also applies to combinations of expressions so `@Inject(MyConstants.NAME_ONE, "two")` changes to `@Inject("one", "two")`

Currently supported values of expressions:
- `String`
- `Bool`
- `Int`

Currently supported expressions that will be replaced:
- Constant in current class
  - `@Meta(TEST)`
- Constant in different class
  - `@Meta(MyClass.TEST)`
- Constant in different class (with reference using FQCN)
  - `@Meta(my.pack.MyClass.TEST)`

Note that the only expressions that are replaced are `[public] static var`. Non-static variables are not being searched so they won't be found.

**Important: If used with `IInjectorContainer` the order matters:**

Only this order of implementation will work because of the macro execution order - fix will come soon:

`class MyClass implements IInjectorContainer implements IAnnotationReplace `

### To go further
* [0.21.0 changlog](https://github.com/DoclerLabs/hexMachina/releases/tag/0.21.0)
* [How to get started?](http://hexmachina.org/docs/getstarted/)

