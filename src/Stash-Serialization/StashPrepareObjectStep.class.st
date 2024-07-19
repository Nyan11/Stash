Class {
	#name : #StashPrepareObjectStep,
	#superclass : #StashStep,
	#category : #'Stash-Serialization-stash-steps'
}

{ #category : #actions }
StashPrepareObjectStep >> prepareObject: anObject on: aStash [

	| reference |
	aStash
		at: anObject
		ifPresent: [ :stashObject |
			stashObject increaseOccurences.
			^ self ]
		ifAbsentPut: [ reference := anObject asStashObject ].
	reference nextInstances do: [ :each |
		self prepareObject: each on: aStash ]
]

{ #category : #actions }
StashPrepareObjectStep >> runOn: aStash [

	self prepareObject: aStash rootObject on: aStash
]
