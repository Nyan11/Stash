Class {
	#name : #StashContructGeneralObjectsStep,
	#superclass : #StashStep,
	#category : #'Stash-Serializer-stash'
}

{ #category : #'as yet unclassified' }
StashContructGeneralObjectsStep >> constructAssociation: aStashAssociation on: aStash [

	aStashAssociation propertiesAreSet.
	aStash addOnSourceCode: '('.
	self nextInstance: aStashAssociation object key on: aStash.
	aStash addOnSourceCode: ') -> ('.
	self nextInstance: aStashAssociation object value on: aStash.
	aStash addOnSourceCode: ')'.

]

{ #category : #'as yet unclassified' }
StashContructGeneralObjectsStep >> constructCollection: aStashCollection on: aStash [

	aStashCollection propertiesAreSet.
	aStash addOnSourceCode: '{<r>'.
	aStashCollection object do: [ :each | self nextInstance: each on: aStash] separatedBy: [ aStash addOnSourceCode: '.<r>' ].
	aStash addOnSourceCode: '}'.
	
]

{ #category : #actions }
StashContructGeneralObjectsStep >> constructObject: aStashObject on: aStash [

	aStash addOnSourceCode: aStashObject constructorOrTag.
	aStashObject isPropertiesSet ifTrue: [ ^ self ].
	aStashObject propertiesAreSet.
	aStashObject nextSettersAndInstances do: [ :association | aStash addOnSourceCode: '<r>'.
			aStash addOnSourceCode: association key.
			self
				nextInstance: (association value)
				on: aStash ]
		separatedBy: [ aStash addOnSourceCode: ';<r>' ].
	aStash addOnSourceCode: ';yourself'
]

{ #category : #'as yet unclassified' }
StashContructGeneralObjectsStep >> constructPoint: aStashAssociation on: aStash [

	aStashAssociation propertiesAreSet.
	aStash addOnSourceCode: '('.
	self nextInstance: aStashAssociation object x on: aStash.
	aStash addOnSourceCode: ') @ ('.
	self nextInstance: aStashAssociation object y on: aStash.
	aStash addOnSourceCode: ')'
]

{ #category : #actions }
StashContructGeneralObjectsStep >> nextInstance: anObject on: aStash [

	| reference |
	reference := aStash identityDictionary at: anObject.
	aStash addOnSourceCode: '('.
	self nextReference: reference on: aStash.
	aStash addOnSourceCode: ')'
]

{ #category : #actions }
StashContructGeneralObjectsStep >> nextReference: aStashObject on: aStash [

	(aStashObject shouldBeTagged and: [ aStashObject isPropertiesSet ])
		ifTrue: [
			aStash addOnSourceCode: aStashObject tag.
			^ self ].
	aStashObject isStashCollection ifTrue: [
		self constructCollection: aStashObject on: aStash.
		^ self ].
	aStashObject isStashAssociation ifTrue: [
		self constructAssociation: aStashObject on: aStash.
		^ self ].
	aStashObject isStashPoint ifTrue: [
		self constructPoint: aStashObject on: aStash.
		^ self ].
	aStashObject isStashDictionary ifTrue: [
		self constructDictionary: aStashObject on: aStash.
		^ self ].
	self constructObject: aStashObject on: aStash
]

{ #category : #actions }
StashContructGeneralObjectsStep >> runOn: aStash [

	self nextInstance: aStash rootObject on: aStash
]
