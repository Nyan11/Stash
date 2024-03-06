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

{ #category : #actions }
StashContructGeneralObjectsStep >> constructBlAttributeRope: aStashObject on: aStash [

	aStash addOnSourceCode: aStashObject constructorOrTag.
	aStashObject isPropertiesSet ifTrue: [ ^ self ].

	aStashObject propertiesAreSet.
	aStash addOnSourceCode: '<r>'.
	self
		setProperty: #attributes asStashProperty
		ofObject: aStashObject object
		on: aStash.
	aStash addOnSourceCode: '<r>'.
	self setProperty: #rope asStashProperty ofObject: aStashObject object on: aStash
]

{ #category : #'as yet unclassified' }
StashContructGeneralObjectsStep >> constructBlLayoutConstraints: aStashObject on: aStash [
	"horizontal - vertical"

	aStash addOnSourceCode: '[ :constraints |<r>'.
	aStashObject allHorizontalSetters
		do: [ :aProperty |
			aStash addOnSourceCode: 'constraints horizontal '.
			self
				setProperty: aProperty
				ofObject: aStashObject object
				on: aStash.
			aStash addOnSourceCode: '.<r>' ].
	aStashObject allVerticalSetters
		do: [ :aProperty |
			aStash addOnSourceCode: 'constraints vertical '.
			self
				setProperty: aProperty
				ofObject: aStashObject object
				on: aStash.
				aStash addOnSourceCode: '.<r>' ].

	"Layout"
	aStashObject allLayoutSettersAndNames do: [ :association |
		| currentLayoutConstraints |
		currentLayoutConstraints := aStashObject object perform:
			                            association key.

		"Layout :: horizontal - vertical"
		(aStashObject allHorizontalSettersFor: currentLayoutConstraints)
			do: [ :aProperty |
				aStash addOnSourceCode: 'constraints '.
				aStash addOnSourceCode: association key.
				aStash addOnSourceCode: ' horizontal '.
				self
					setProperty: aProperty
					ofObject: currentLayoutConstraints
					on: aStash.
					aStash addOnSourceCode: '.<r>' ].
		(aStashObject allVerticalSettersFor: currentLayoutConstraints)
			do: [ :aProperty |
				aStash addOnSourceCode: 'constraints '.
				aStash addOnSourceCode: association key.
				aStash addOnSourceCode: ' vertical '.
				self
					setProperty: aProperty
					ofObject: currentLayoutConstraints
					on: aStash.
					 aStash addOnSourceCode: '.<r>' ].

		"Layout :: Properties"
		association value
			do: [ :aProperty |
				aStash addOnSourceCode: 'constraints '.
				aStash addOnSourceCode: association key.
				aStash addOnSourceCode: ' '.
				self
					setProperty: aProperty
					ofObject: currentLayoutConstraints
					on: aStash.
					aStash addOnSourceCode: '.<r>' ] ].

	"Properties"
	aStashObject allSetters
		do: [ :aProperty |
			aStash addOnSourceCode: 'constraints '.
			self
				setProperty: aProperty
				ofObject: aStashObject object
				on: aStash.
				aStash addOnSourceCode: '.<r>' ].
	aStash addOnSourceCode: ']'
]

{ #category : #'as yet unclassified' }
StashContructGeneralObjectsStep >> constructBlTransformation: aStashObject on: aStash [

	aStash addOnSourceCode: '[ :transformation |<r>'.

	"Default origin"
	(aStashObject allSettersFor: aStashObject defaultOrigin
		 ) do: [
		:aProperty |
		aStash addOnSourceCode: 'transformation '.
		self setProperty: aProperty ofObject: aStashObject object on: aStash.
		aStash addOnSourceCode: '.<r>' ].

	"Custom origin"
	aStashObject allSettersOriginsExceptDefault: [ :origin |
		aStash addOnSourceCode: 'transformation '.
		aStash addOnSourceCode: origin asStashMethodForTransformationBloc.
		aStash addOnSourceCode: '.<r>'.
		(aStashObject allSettersFor: origin) do: [ :aProperty |
			aStash addOnSourceCode: 'transformation '.
			self
				setProperty: aProperty
				ofObject: aStashObject object
				on: aStash.
			aStash addOnSourceCode: '.<r>' ] ].
	aStash addOnSourceCode: ']'
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
	aStashObject allSetters
		do: [ :aProperty |
			aStash addOnSourceCode: '<r>'.
			self setProperty: aProperty ofObject: aStashObject object on: aStash ]
		separatedBy: [ aStash addOnSourceCode: ';<r>' ]
]

{ #category : #initialization }
StashContructGeneralObjectsStep >> setProperty: aStashProperty ofObject: anObject on: aStash [

	| argument |
	aStashProperty setter isBlock
		ifTrue: [
		aStash addOnSourceCode: (aStashProperty setter value: anObject) ]
		ifFalse: [ aStash addOnSourceCode: aStashProperty setter ].


	"If property is a getter we put the get value as an argument."
	aStashProperty isStashGetter ifFalse: [ ^ self ].
	
	argument := aStashProperty getter isBlock ifTrue: [  aStashProperty getter value: anObject ] ifFalse: [  anObject perform: aStashProperty getter].
	self nextInstance: argument on: aStash
]
