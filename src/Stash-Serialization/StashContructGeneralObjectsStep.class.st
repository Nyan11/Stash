Class {
	#name : #StashContructGeneralObjectsStep,
	#superclass : #StashStep,
	#category : #'Stash-Serialization-stash-steps'
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
			aStash addOnSourceCode: Character space.
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
	reference := aStash at: anObject.
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

{ #category : #initialization }
StashContructGeneralObjectsStep >> setMonoArgumentProperty: aStashProperty ofObject: anObject on: aStash [

	aStashProperty setter isBlock
		ifTrue: [
		aStash addOnSourceCode: (aStashProperty setter value: anObject) ]
		ifFalse: [ aStash addOnSourceCode: aStashProperty setter ].

	"If property is a getter we put the get value as an argument."
	aStashProperty isStashGetter ifFalse: [ ^ self ].

	aStashProperty getter isBlock ifTrue: [
		self
			nextInstance: (aStashProperty getter value: anObject)
			on: aStash.
		^ self ].
	aStashProperty getter isSymbol ifTrue: [
		self
			nextInstance: (anObject perform: aStashProperty getter)
			on: aStash.
		^ self ]
]

{ #category : #initialization }
StashContructGeneralObjectsStep >> setMultiArgumentsProperty: aStashProperty ofObject: anObject on: aStash [

	| setter getters count |
	setter := aStashProperty setter isBlock
		          ifTrue: [ aStashProperty setter value: anObject ]
		          ifFalse: [ aStashProperty setter ].
	getters := aStashProperty getter isCollection ifTrue: [
		           aStashProperty getter collect: [ :each |
			           each isBlock ifTrue: [ each value: anObject ]
			           ifFalse: [ anObject perform: each ] ] ].
	"setter is 'message: arg1 message: arg2'"

	"setter is 'arg1 message arg2'"
	setter last = $: ifFalse: [
		self nextInstance: getters first on: aStash.
		aStash addOnSourceCode: setter.
		self nextInstance: getters last on: aStash.
		^ self ].

	count := 1.
	(($: split: setter) select: #isNotEmpty thenCollect: [ :each | each asSymbol asMutator]) do: [
		:each |
		aStash addOnSourceCode: each.
		self nextInstance: (getters at: count) on: aStash.
		count := count + 1 ]
]

{ #category : #actions }
StashContructGeneralObjectsStep >> setPropertiesOf: aStashObject on: aStash [

	aStashObject propertiesAreSet.
	aStashObject allSetters
		do: [ :aProperty |
			aStash addOnSourceCode: '<r>'.
			self setProperty: aProperty ofObject: aStashObject object on: aStash ]
		separatedBy: [ aStash addOnSourceCode: ';<r>' ]
]

{ #category : #initialization }
StashContructGeneralObjectsStep >> setProperty: aStashProperty ofObject: anObject on: aStash [

	aStashProperty isMultiArguments ifFalse: [
		self
			setMonoArgumentProperty: aStashProperty
			ofObject: anObject
			on: aStash.
		^ self ].
	self
		setMultiArgumentsProperty: aStashProperty
		ofObject: anObject
		on: aStash.

]
