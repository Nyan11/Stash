Extension { #name : #BlLinearLayoutConstraintsHorizontal }

{ #category : #'*Stash-Serializer' }
BlLinearLayoutConstraintsHorizontal >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add:
			[ :n | self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]
