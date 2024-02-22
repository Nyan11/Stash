Class {
	#name : #StashBlTransformation,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'as yet unclassified' }
StashBlTransformation >> allSettersFor: aBlAffineTransformationOrigin [

	^ self allSetters select: [ :each | each context value origin = aBlAffineTransformationOrigin ]
]

{ #category : #'as yet unclassified' }
StashBlTransformation >> allSettersOriginsExceptDefault: aFullBlockClosure [

	| origins currentOrigin |
	origins := Set new.

	self allSetters do: [ :each |
		currentOrigin := each context value origin.
		currentOrigin = self defaultOrigin ifFalse: [ 
		(origins includes: currentOrigin) ifFalse: [
			origins add: currentOrigin.
			aFullBlockClosure value: currentOrigin ] ] ].
	origins
]

{ #category : #'stash - step' }
StashBlTransformation >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructBlTransformation: self
		on: aStash
]

{ #category : #'as yet unclassified' }
StashBlTransformation >> defaultOrigin [

	^ BlAffineTransformationCenterOrigin defaultInstance
]
