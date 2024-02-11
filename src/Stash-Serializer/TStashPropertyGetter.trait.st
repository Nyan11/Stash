Trait {
	#name : #TStashPropertyGetter,
	#category : #'Stash-Serializer-stash'
}

{ #category : #resolving }
TStashPropertyGetter >> getter [

	self context isSymbol ifTrue: [ ^ self context ].
	self context isBlock ifTrue: [ ^ self context ].
	^ self context value
]
