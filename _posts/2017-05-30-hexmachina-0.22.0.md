---
layout: post
title:  "0.22.0 - @Dependency and IDependencyOwner"
image: /img/blog/hexmachina-welcome.jpg
category: news
tags: [release, inject, dsl]
---
Let's highlight some new feature on this new release. 

### hex.di.mapping.IDependencyOwner
With this new feature is possible to check injector dependencies at compiletime. 
With `@Dependency` metadata is possible to declare mapping dependencies on classes that implements `hex.di.mapping.IDependencyOwner`, 
```haxe
@Dependency( var _:String )
@Dependency( var name:InterfaceWithGeneric<String> )
@Dependency( var _:Void->Void, hex.di.mock.MockConstants.NAME_ONE )
class DependencyOwner implements hex.di.mapping.IDependencyOwner
{
	var _injector = new Injector();
	
	public function new() {}
	
	public function getInjector() : IDependencyInjector return this._injector;
}
```
In this example, `DependencyOwner` request mapping of : 
| `fromType`  | `withName` |
| ------------- | ------------- |
| `String`  | no name  |
| `InterfaceWithGeneric<String>`  | "name"  |
| `Void->Void`  | the value of `hex.di.mock.MockConstants.NAME_ONE`  |

Mapping Could be provided by code with static Extension `hex.di.util.MappingDefinitionUtil.addDefinition`: 
```haxe
var f2 = function() {};
var mapping : MappingDefinition = { fromType: "String", toValue: "test" };
var mappings : Array<MappingDefinition> = [
	{ fromType: "hex.di.mock.types.InterfaceWithGeneric<String>", toClass: ClazzWithGeneric, withName: "name" },
	{ fromType: "Void->Void", toValue: f2, withName:hex.di.mock.MockConstants.NAME_ONE }
];

var dependencyOwner = new DependencyOwner();
dependencyOwner.addDefinition( [mapping].concat( mappings ) );

var injector = dependencyOwner.getInjector();
```

Or in DSL through the constructor like :  
```haxe
@Dependency( var _			:String )
@Dependency( var id			:Interface )
@Dependency( var anotherID	:Interface )
class AnotherDependenciesOwner implements IDependencyOwner
{
	var _injector = new Injector();
	
	public function new( mapping : MappingDefinition, mappings : Array<MappingDefinition> ) {}
	
	public function getInjector() : IDependencyInjector return this._injector;
}
```
```haxe
@context( name = 'applicationContext' )
{
	s = "test";
	mapping1 = mapping({fromType: "String", toValue: s});
	mapping2 = mapping( {fromType: "hex.mock.Interface", toValue: new hex.mock.Clazz(), withName: "anotherID"} );
	
	mappings = new Array<hex.di.mapping.MappingDefinition>
	(
		mapping2,
		mapping( {fromType: "hex.mock.Interface", toClass: hex.mock.Clazz, withName: "id", asSingleton:true} )
	);

	owner = new AnotherDependenciesOwner( mapping1, mappings );
}
```

## To go further
* [0.22.0 changlog](https://github.com/DoclerLabs/hexMachina/releases/tag/0.22.0)
* [How to get started?](http://hexmachina.org/docs/getstarted/)

