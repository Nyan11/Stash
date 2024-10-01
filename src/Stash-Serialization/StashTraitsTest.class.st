Class {
	#name : #StashTraitsTest,
	#superclass : #TestCase,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #tests }
StashTraitsTest >> testTraits1 [

	| object source newObject |
	object := StashTestTraits new
		          test4: 'hello';
		          yourself.
	source := Stash new serialize: object.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject test4 equals: 'hello'.
]

{ #category : #tests }
StashTraitsTest >> testTraits2 [

	| object source newObject |
	object := StashTestTraitsSubClass new
		          test4: 'hello';
		          yourself.
	source := Stash new serialize: object.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject test4 equals: 'hello'
]
