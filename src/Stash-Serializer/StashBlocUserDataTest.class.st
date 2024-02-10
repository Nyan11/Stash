Class {
	#name : #StashBlocUserDataTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocUserDataTest >> testId [

	| object source newObject |
	object := BlElement new id: #toto.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   id: #toto;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject id equals: #toto
]
