---
layout: post
title:  "flow - @type and @lazy"
image: /img/blog/hexmachina-welcome.jpg
category: News
tags: [release, flow, dsl]
---
Let's highlight two new features in flow arrived with hexMachina `0.27.0`. 

### Force typing in flow DSL with new `@type`
By default, every object instancied in DSL use his own type as property type. With the new `@type` flow keyword is possible to apply another type to the property. Not to be confused with `@map_type` use to map object in ApplicationContext injector. 
```haxe
@context()
{
    @type( 'hex.log.ILogger' )
    logger = new hex.log.Logger( loggerContext, "myLogger");

    loggerContext = hex.log.LoggerContext.getContext();
}
```
Is equal to that in haxe : 
```haxe
class hex.context.applicationContext implements hex.context.IapplicationContext_0 {

	public var loggerContext:hex.log.LoggerContext;
	public var logger:hex.log.ILogger;

	public function m_dcea6fa1359cfeff3f1f1e4264791aa7() {
		var loggerContext = hex.log.LoggerContext.getContext();
		this.loggerContext = loggerContext;
		var logger = new hex.log.Logger(loggerContext, "myLogger");
		this.logger = logger;
	}
}
```

### Define lazy instanciation in flow DSL with `@lazy`
Declaration with `@lazy` metadata will not be executed until is used somewhere. 
context/flow/primitives/lazyInt.flow - [link](https://github.com/DoclerLabs/hexDSL/blob/201058ad04b70e34268d23d9522b9f18c7aea1c0/test/context/flow/primitives/lazyInt.flow)
```haxe
@context( name = 'applicationContext' )
{
	@lazy
	i = hex.mock.LazyProvider.provide( -3 );
	
	@lazy
	o = new hex.mock.LazyClass( 'test' );
}
```
test/hex/mock/LazyClass.hx - [link](https://github.com/DoclerLabs/hexDSL/blob/201058ad04b70e34268d23d9522b9f18c7aea1c0/test/hex/mock/LazyClass.hx)
```haxe
class LazyClass 
{
	public static var value : Any;
	
	public function new( o : Any ) 
	{
		LazyClass.value = o;
	}
}
```
test/hex/mock/LazyProvider.hx - [link](https://github.com/DoclerLabs/hexDSL/blob/201058ad04b70e34268d23d9522b9f18c7aea1c0/test/hex/mock/LazyProvider.hx)
```haxe
class LazyProvider 
{
	public static var value : Any;
	
	public function new() {}
	
	public static function provide<T>( o : T ) : T
	{
		LazyProvider.value = o;
		return o;
	}
}
```
@Test( "test building lazy primitive" ) - [link](https://github.com/DoclerLabs/hexDSL/blob/201058ad04b70e34268d23d9522b9f18c7aea1c0/test/hex/compiletime/flow/BasicStaticFlowCompilerTest.hx#L1188-L1203)
```haxe
@Test( "test building lazy primitive" )
public function testBuildingLazyInt() : Void
{
	var code = BasicStaticFlowCompiler.compile( this._myApplicationAssembler, "context/flow/primitives/lazyInt.flow", "BasicStaticFlowCompiler_testBuildingLazyInt" );
	LazyProvider.value = null;
	LazyClass.value = null;
	code.execute();
	
	Assert.isNull( LazyProvider.value );
	Assert.equals( -3, code.locator.i );
	Assert.equals( -3, LazyProvider.value );
	
	Assert.isNull( LazyClass.value );
	Assert.isNotNull( code.locator.o );
	Assert.equals( 'test', LazyClass.value );
}
```
### To go further
* [0.27.0 changlog](https://github.com/DoclerLabs/hexMachina/releases/tag/0.27.0)
* [How to get started?](http://hexmachina.org/docs/getstarted/)

