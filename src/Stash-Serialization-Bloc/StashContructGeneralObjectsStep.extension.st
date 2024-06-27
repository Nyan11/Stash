Extension { #name : 'StashContructGeneralObjectsStep' }

{ #category : '*Stash-Serialization-Bloc' }
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

{ #category : '*Stash-Serialization-Bloc' }
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

{ #category : '*Stash-Serialization-Bloc' }
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
