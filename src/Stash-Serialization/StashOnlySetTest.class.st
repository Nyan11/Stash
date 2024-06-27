Class {
	#name : #StashOnlySetTest,
	#superclass : #TestCase,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #tests }
StashOnlySetTest >> testSetOnly1 [

	| object source newObject |
	object := StashTestOnlySet1 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestOnlySet1 new
   stateFalse;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self deny: newObject state
]

{ #category : #tests }
StashOnlySetTest >> testSetOnly2 [

	| object source newObject |
	object := StashTestOnlySet1 new stateTrue.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestOnlySet1 new
   stateTrue;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject state
]

{ #category : #tests }
StashOnlySetTest >> testSetOnly3 [

	| object source newObject |
	object := StashTestOnlySet2 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestOnlySet2 new'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self deny: newObject state
]

{ #category : #tests }
StashOnlySetTest >> testSetOnly4 [

	| object source newObject |
	object := StashTestOnlySet2 new stateTrue.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestOnlySet2 new
   stateTrue;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject state
]

{ #category : #tests }
StashOnlySetTest >> testSetOnly5 [

	| object source newObject |
	object := StashTestOnlySet3 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestOnlySet3 new'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self deny: newObject state
]

{ #category : #tests }
StashOnlySetTest >> testSetOnly6 [

	| object source newObject |
	object := StashTestOnlySet3 new stateTrue.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestOnlySet3 new
   stateTrue;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject state
]
