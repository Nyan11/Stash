Trait {
	#name : #TStashPropertyGetter,
	#category : #'Stash-Serialization-stash'
}

{ #category : #resolving }
TStashPropertyGetter >> getter [

	self context isSymbol ifTrue: [ ^ self context ].
	self context isBlock ifTrue: [ ^ self context ].
	^ self context value
]

{ #category : #testing }
TStashPropertyGetter >> isStashGetter [

	^ true
]
