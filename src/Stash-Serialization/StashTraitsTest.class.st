Class {
	#name : 'StashTraitsTest',
	#superclass : 'TestCase',
	#category : 'Stash-Serialization-test-cases',
	#package : 'Stash-Serialization',
	#tag : 'test-cases'
}

{ #category : 'tests' }
StashTraitsTest >> testTraits1 [

	| object source newObject |
	object := StashTestTraits new
		          test1: 'hello';
		          test2: 'world';
		          yourself.
	source := Stash new serialize: object.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject test1 equals: 'hello'.
	self assert: newObject test2 equals: 'world'
]

{ #category : 'tests' }
StashTraitsTest >> testTraits2 [

	| object source newObject |
	object := StashTestTraitsSubClass new
		          test1: 'hello';
		          test2: 'world';
		          yourself.
	source := Stash new serialize: object.
	
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject test1 equals: 'hello'.
	self assert: newObject test2 equals: 'world'
]
