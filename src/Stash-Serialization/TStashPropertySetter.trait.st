Trait {
	#name : #TStashPropertySetter,
	#category : #'Stash-Serialization-stash'
}

{ #category : #testing }
TStashPropertySetter >> isStashSetter [

	^ true
]

{ #category : #resolving }
TStashPropertySetter >> setter [

	self context isSymbol ifTrue: [ ^ self context ].
	self context isBlock ifTrue: [ ^ self context ].
	self context key isSymbol ifTrue: [ ^ self context key ].
	^ self context key value: self context value
]
