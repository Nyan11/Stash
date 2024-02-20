Class {
	#name : #StashBlocTransformationTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocTransformationTest >> testRotation [

	| object source newObject |
	object := BlElement new transformDo: [ :t | t rotateBy: 90 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
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
]
