Extension { #name : #Dictionary }

{ #category : #'*Stash-Serialization' }
Dictionary >> asStashObject [

	^ StashObject new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serialization' }
Dictionary >> shouldBeTagged [

	^ true
]

{ #category : #'*Stash-Serialization' }
Dictionary >> stashAssociationsAccessors [

	<stashAccessors>
	| accessors |
	accessors := OrderedCollection new.
	self associations do: [ :each |
		accessors add: #at:put: -> {
				[ :dict | each key ].
				[ :dict | each value ]} ].
	^ accessors
]
