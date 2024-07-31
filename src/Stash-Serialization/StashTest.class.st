Class {
	#name : #StashTest,
	#superclass : #TestCase,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #tests }
StashTest >> testArray1 [

	| object source |
	object := {  }.
	source := Stash new serialize: object.
	self assert: source equals: '{}'.
]

{ #category : #tests }
StashTest >> testArray2 [

	| object source newObject |
	object := { 1. 2. 3 }.
	source := Stash new serialize: object.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject equals: {1 . 
2 . 
3}
]

{ #category : #tests }
StashTest >> testArray3 [

	| object source |
	object := { Object new }.
	source := Stash new serialize: object.

	self assert: source equals: '{Object new}'.
]

{ #category : #tests }
StashTest >> testAssociation1 [

	| object source |
	object := Object new -> Object new.
	source := Stash new serialize: object.
	self assert: source equals: 'Object new -> Object new'
]

{ #category : #tests }
StashTest >> testAssociation2 [

	| object source |
	object := 1 -> 2.
	source := Stash new serialize: object.
	self assert: source equals: '1 -> 2'
]

{ #category : #tests }
StashTest >> testBlockClosure1 [

	| object source |
	object := [  ].
	source := Stash new serialize: object.
	self assert: source equals: '[  ]'
]

{ #category : #tests }
StashTest >> testBlockClosure2 [

	| object source |
	object := [ :a :b :c |  ].
	source := Stash new serialize: object.
	self assert: source equals: '[:a :b :c |   ]'
]

{ #category : #tests }
StashTest >> testBlockClosure3 [

	| object source newObject |
	object := [ :a | a + 1 ].
	source := Stash new serialize: object.
	self assert: (object value: 5) equals: 6.
	self assert: source equals: '[:a |  a + 1 ]'.
	newObject := Stash new materialize: source.
	self assert: (newObject value: 5) equals: 6.
]

{ #category : #tests }
StashTest >> testBlockClosure4 [

	| object source outerContext |
	outerContext := 1.
	object := [ :a | a + outerContext ].
	[source := Stash new serialize: object] on: StashCannotSerializeBlockClosure do: [ self assert: true. ^ self ].
self fail.

]

{ #category : #tests }
StashTest >> testBlockClosure5 [

	| object source newObject |
	object := [ :a | a + a + 1 ].
	source := Stash new serialize: object.
	self assert: (object value: 5) equals: 11.
	self assert: source equals: '[:a |  a + a + 1 ]'.
	newObject := Stash new materialize: source.
	self assert: (newObject value: 5) equals: 11
]

{ #category : #tests }
StashTest >> testBlockClosure6 [

	| object source newObject |
	object := [ :a | | innerContext | innerContext := 1 . a + a + innerContext ].
	source := Stash new serialize: object.
	self assert: (object value: 5) equals: 11.
	self assert: source equals: '[:a |  | innerContext |
innerContext := 1.
a + a + innerContext ]'.
	newObject := Stash new materialize: source.
	self assert: (newObject value: 5) equals: 11
]

{ #category : #tests }
StashTest >> testClass1 [

	| object source |
	object := Object.
	source := Stash new serialize: object.
	self assert: source equals: 'Object'
]

{ #category : #tests }
StashTest >> testClass2 [

	| object source |
	object := { Object . Object }.
	source := Stash new serialize: object.
	self assert: source equals: '| objectclass1 |
objectclass1 := Object.
{objectclass1 . 
objectclass1}'
]

{ #category : #tests }
StashTest >> testColor1 [

	| object source newObject |
	object := Color red.
	source := Stash new serialize: object.
	self assert: source equals: 'Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject equals: Color red
]

{ #category : #tests }
StashTest >> testColor2 [

	| object source newObject |
	object := Color blue.
	source := Stash new serialize: object.
	self assert: source equals: 'Color r: 0.0 g: 0.0 b: 1.0 alpha: 1.0'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject equals: Color blue
]

{ #category : #tests }
StashTest >> testColor3 [

	| object source newObject |
	1 to: 10 do: [ :i |
		object := Color random.
		source := Stash new serialize: object.
		newObject := self class compiler
			             source: source;
			             evaluate.
		self assert: newObject equals: object ]
]

{ #category : #tests }
StashTest >> testColor4 [

	| object source newObject |
	object := Color blue alpha: 0.5.
	source := Stash new serialize: object.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject alpha equals: object alpha
]

{ #category : #tests }
StashTest >> testLiteral1 [

	self assert: (Stash new serialize: 1) equals: '1'
]

{ #category : #tests }
StashTest >> testLiteral2 [

	self assert: (Stash new serialize: true) equals: 'true'
]

{ #category : #tests }
StashTest >> testLiteral3 [

	self assert: (Stash new serialize: 'hello') equals: '''hello'''
]

{ #category : #tests }
StashTest >> testLiteral4 [

	self assert: (Stash new serialize: #world) equals: '#world'
]

{ #category : #tests }
StashTest >> testObject1 [

	self assert: (Stash new serialize: Object new) equals: 'Object new'
]

{ #category : #tests }
StashTest >> testPoint1 [

	| object source |
	object := 6 @ 7.
	source := Stash new serialize: object.
	self assert: source equals: '6 @ 7'
]

{ #category : #tests }
StashTest >> testPoint2 [

	| object source |
	object := -45 @ 70.
	source := Stash new serialize: object.
	self assert: source equals: '-45 @ 70'
]
