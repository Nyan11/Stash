Class {
	#name : #StashBlocUserDataTest,
	#superclass : #TestCase,
	#category : #'Stash-Serialization-Bloc-test-cases'
}

{ #category : #tests }
StashBlocUserDataTest >> testId1 [

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

{ #category : #tests }
StashBlocUserDataTest >> testId2 [

	| object source newObject |
	object := BlElement new id: nil.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject id equals: nil
]

{ #category : #tests }
StashBlocUserDataTest >> testId3 [

	| object source newObject |
	object := BlElement new elementId:
		          ((BlElementId named: #test) indexed: 1).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   elementId: (BlElementIndexedId new
         index: 1;
         prefixId: (BlElementNamedId new
               identifier: #test;
               yourself);
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject id equals: 'test-1'
]
