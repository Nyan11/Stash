Class {
	#name : 'StashBlocTransformationTest',
	#superclass : 'TestCase',
	#category : 'Stash-Serialization-Bloc-test-cases',
	#package : 'Stash-Serialization-Bloc',
	#tag : 'test-cases'
}

{ #category : 'tests' }
StashBlocTransformationTest >> testMatrix1 [

	| matrix object source newObject |
	matrix := BlMatrix2D new.
	object := BlElement new transformDo: [ :t | t matrix: matrix ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation topLeftOrigin.
      transformation matrix: BlMatrix2D new ];
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
				affineTransformation transformations first matrix
		equals: matrix
]

{ #category : 'tests' }
StashBlocTransformationTest >> testMatrix2 [

	| matrix object source newObject |
	matrix := BlMatrix2D new
		          x: 1;
		          y: 2;
		          sx: 3;
		          sy: 4;
		          shx: 5;
		          shy: 6.
	object := BlElement new transformDo: [ :t | t matrix: matrix ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation topLeftOrigin.
      transformation matrix: (BlMatrix2D new
               x: 1;
               y: 2;
               shx: 5;
               shy: 6;
               sx: 3;
               sy: 4;
               yourself) ];
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
				affineTransformation transformations first matrix
		equals: matrix
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin1 [

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
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin
		equals: BlAffineTransformationCenterOrigin defaultInstance
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin2 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t centerOrigin. t rotateBy: 90 ].
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
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin
		equals: BlAffineTransformationCenterOrigin defaultInstance
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin3 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t topLeftOrigin.
		          t rotateBy: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation topLeftOrigin.
      transformation rotateBy: 90 ];
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
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin
		equals: BlAffineTransformationTopLeftOrigin new
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin4 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t topLeftOrigin.
		          t rotateBy: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation topLeftOrigin.
      transformation rotateBy: 90 ];
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
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin
		equals: BlAffineTransformationTopLeftOrigin new.
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin5 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t rightCenterOrigin.
		          t rotateBy: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation rightCenterOrigin.
      transformation rotateBy: 90 ];
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
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin
		equals: BlAffineTransformationRightCenterOrigin new
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin6 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t normalizedOrigin: 0.5 @ 0.5.
		          t rotateBy: 90 ].
	source := Stash new serialize: object.
	self assert: source equals:'BlElement new
   transformDo: [:transformation |  transformation normalizedOrigin: 0.5 @ 0.5.
      transformation rotateBy: 90 ];
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
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin class
		equals: BlAffineTransformationNormalizedPositionOrigin.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin position
		equals: 0.5 @0.5
]

{ #category : 'tests' }
StashBlocTransformationTest >> testOrigin7 [

	| object source newObject |
	object := BlElement new transformDo: [ :t |
		          t normalizedOrigin: 0.5 @ 0.5.
		          t rotateBy: 90.
		          t normalizedOrigin: 0.5 @ 0.
		          t rotateBy: 80.
		          t normalizedOrigin: 0 @ 0.5.
		          t rotateBy: 70 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation normalizedOrigin: 0.5 @ 0.5.
      transformation rotateBy: 90.
      transformation normalizedOrigin: 0.5 @ 0.
      transformation rotateBy: 80.
      transformation normalizedOrigin: 0 @ 0.5.
      transformation rotateBy: 70 ];
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
		equals: 3.
	"First"
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first angle
		equals: 90.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first axis
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin class
		equals: BlAffineTransformationNormalizedPositionOrigin.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first origin position
		equals: 0.5 @ 0.5.
	"Second"
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations second angle
		equals: 80.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations second axis
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations second origin class
		equals: BlAffineTransformationNormalizedPositionOrigin.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations second origin position
		equals: 0.5 @ 0.
	"Third"
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations last angle
		equals: 70.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations last axis
		equals: BlVector zAxis.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations last origin class
		equals: BlAffineTransformationNormalizedPositionOrigin.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations last origin position
		equals: 0 @ 0.5.
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
StashBlocTransformationTest >> testShear1 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t shearBy: 0 @ 0 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation shearBy: 0 @ 0 ];
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
				affineTransformation transformations first coefficient
		equals: 0 @ 0.
	
]

{ #category : 'tests' }
StashBlocTransformationTest >> testShear2 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t shearBy: 0.5 @ 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation shearBy: 0.5 @ 0.5 ];
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
				affineTransformation transformations first coefficient
		equals: 0.5 @ 0.5
]

{ #category : 'tests' }
StashBlocTransformationTest >> testShear3 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t skewX: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation skewX: 90.0 ];
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
				affineTransformation transformations first coefficient y 
		equals: 0.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first coefficient x
		equals: 90 degreesToRadians tan negated
]

{ #category : 'tests' }
StashBlocTransformationTest >> testShear4 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t skewY: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation skewY: 90.0 ];
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
				affineTransformation transformations first coefficient x
		equals: 0.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first coefficient y
		equals: 90 degreesToRadians tan negated
]

{ #category : 'tests' }
StashBlocTransformationTest >> testTranslate1 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t translateBy: 200 @ 50 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation translateBy: 200 @ 50 ];
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
				affineTransformation transformations first translation x
		equals: 200.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first translation y
		equals: 50
]

{ #category : 'tests' }
StashBlocTransformationTest >> testTranslate2 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t translateBy: -200 @ 50 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   transformDo: [:transformation |  transformation translateBy: -200 @ 50 ];
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
				affineTransformation transformations first translation x
		equals: -200.
	self
		assert:
			newObject transformation asElementTransformation
				affineTransformation transformations first translation y
		equals: 50
]

{ #category : 'tests' }
StashBlocTransformationTest >> testTranslate3 [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t translateBy: 0 @ 0 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		newObject transformation isIdentity.
	
]
