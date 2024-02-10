Class {
	#name : #StashContructGeneralObjectsStep,
	#superclass : #StashStep,
	#category : #'Stash-Serializer-stash-steps'
}

{ #category : #'as yet unclassified' }
StashContructGeneralObjectsStep >> addTag: aTag on: aStash [


	aStash addOnSourceCode: aTag.
	
]

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
	self setPropertiesOf: aStashObject on: aStash.
	aStash addOnSourceCode: ';yourself'
]

{ #category : #actions }
StashContructGeneralObjectsStep >> constructObjectWithBuilder: aStashObject on: aStash [

	aStash addOnSourceCode: aStashObject constructorOrTag.
	aStashObject isPropertiesSet ifTrue: [
		aStashObject methodToBuild ifNotNil: [
			aStash addOnSourceCode: aStashObject methodToBuild ].
		^ self ].
	self setPropertiesOf: aStashObject on: aStash.
	aStashObject methodToBuild ifNotNil: [
		aStash addOnSourceCode: ';'.
		aStash addOnSourceCode: aStashObject methodToBuild ]
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
	"Double dispatch to easily add more different objects"
	aStashObject constructForGeneralObjectStep: self on: aStash
]

{ #category : #actions }
StashContructGeneralObjectsStep >> runOn: aStash [

	self nextInstance: aStash rootObject on: aStash
]

{ #category : #actions }
StashContructGeneralObjectsStep >> setPropertiesOf: aStashObject on: aStash [
	aStashObject propertiesAreSet.
	aStashObject nextSettersAndInstances
		do: [ :association |
			aStash addOnSourceCode: '<r>'.
			self setProperty: association on: aStash ]
		separatedBy: [ aStash addOnSourceCode: ';<r>' ].
	
]

{ #category : #actions }
StashContructGeneralObjectsStep >> setProperty: association on: aStash [

	 association key isBlock ifTrue: [ aStash addOnSourceCode: (association key value: association value). ^ self ].
aStash addOnSourceCode: association key.
			self nextInstance: association value on: aStash
]
