Class {
	#name : #StashBlocTransformationTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocTransformationTest >> testReflection1 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t flipX ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation flipX ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first reflection
		equals: (BlVector x: 1 y: -1).
	
]

{ #category : #tests }
StashBlocTransformationTest >> testReflection2 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t flipY ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation flipY ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first reflection
		equals: (BlVector x: -1 y: 1)
]

{ #category : #tests }
StashBlocTransformationTest >> testReflection3 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t flipX . t flipY ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation flipX.
      transformation flipY ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 2.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first reflection
		equals: (BlVector x: 1 y: -1).
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations second reflection
		equals: (BlVector x: -1 y: 1)
]

{ #category : #tests }
StashBlocTransformationTest >> testRotation1 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t rotateBy: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation rotateBy: 90 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first angle
		equals: 90.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first axis
		equals: BlVector zAxis
]

{ #category : #tests }
StashBlocTransformationTest >> testRotation2 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t rotateBy: 180 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation rotateBy: 180 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first angle
		equals: 180.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first axis
		equals: BlVector zAxis
]

{ #category : #tests }
StashBlocTransformationTest >> testRotation3 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t rotateBy: 27 around: BlVector yAxis ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation rotateBy: 27 around: BlVector yAxis ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first angle
		equals: 27.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first axis
		equals: BlVector yAxis
]

{ #category : #tests }
StashBlocTransformationTest >> testScale1 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t scaleBy: 2 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation scaleBy: 2 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first scale x
		equals: 2.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first scale y
		equals: 2
]

{ #category : #tests }
StashBlocTransformationTest >> testScale2 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t scaleBy: 2 @ 3 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation scaleBy: 2 @ 3 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation asElementTransformation
			affineTransformation hasTransformations.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations size
		equals: 1.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first scale x
		equals: 2.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first scale y
		equals: 3
]

{ #category : #tests }
StashBlocTransformationTest >> testScale3 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t scaleBy: 1 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject transformation isIdentity
]
