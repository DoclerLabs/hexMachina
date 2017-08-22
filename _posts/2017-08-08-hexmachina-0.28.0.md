---
layout: post
title:  "0.28.0 - @parser"
image: /img/blog/hexmachina-welcome.jpg
category: news
tags: [release, flow, dsl]
---
Let's highlight some new feature on this new release. 

### Custom parser can be declared in flow DSL with `@parser` metadata
Added in `0.24.0`, `custom parser` can now be directly added in DSL file with `@parser` flow keyword. [Few custom parser examples in hexDSL](https://github.com/DoclerLabs/hexDSL/tree/master/src/hex/compiletime/flow/parser/custom).
```haxe
@context( name = 'applicationContext' )
@parser( hex.compiletime.flow.parser.custom.AddParser )
{
	s = add( "hello", space, "world", space, "!" );
	space =  " ";
	
	i = add( 6, five );
	five = 5;
	
	p = add( p1, new hex.structures.Point( 3, 4 ), p2 );
	p1 = new hex.structures.Point( 5, 5 );
	p2 = new hex.structures.Point( 3, 4 );
}
```

### Code compilation can be cloned with unique assembler reference
Requested for a long time, we can now run the same application few times in the same place without scope problems. ApplicationAssembler is now used as a unique key. More than that, we can manually duplicate DSL with the new `clone` method. 
```haxe
var code = StaticFlowCompiler.compile( assembler, "context/flow/dsl.flow" );
code.execute();
		
var clonedCode = code.clone( new ApplicationAssembler() );
clonedCode.execute();

Assert.isInstanceOf( code.locator.instance, MockClassWithoutArgument );
Assert.isInstanceOf( clonedCode .locator.instance, MockClassWithoutArgument );
		
Assert.notEquals( code.locator.instance, clonedCode .locator.instance );
```

## To go further
* [0.28.0 changlog](https://github.com/DoclerLabs/hexMachina/releases/tag/0.28.0)
* [How to get started?](http://hexmachina.org/docs/getstarted/)

