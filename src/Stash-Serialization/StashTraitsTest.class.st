Class {
	#name : #StashTraitsTest,
	#superclass : #TestCase,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #tests }
StashTraitsTest >> testTraits1 [

	| object source newObject |
	object := StashTestTraits1 new
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

{ #category : #tests }
StashTraitsTest >> testTraits2 [

	| object source newObject |
	object := StashTestTraits1SubClass new
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

{ #category : #tests }
StashTraitsTest >> testTraits3 [

	| object source newObject |
	object := StashTestTraits2 new
		          test4: 'hello';
		          yourself.
	source := Stash new serialize: object.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject test4 equals: 'hello'.
]

{ #category : #tests }
StashTraitsTest >> testTraits4 [

	| object source newObject |
	object := StashTestTraits2SubClass new
		          test4: 'hello';
		          yourself.
	source := Stash new serialize: object.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject test4 equals: 'hello'
]
