Extension { #name : #BlLinearLayoutConstraintsVertical }

{ #category : #'*Stash-Serializer' }
BlLinearLayoutConstraintsVertical >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start vertical ifFalse: [
		settersAndGetters add:
			[ :n | self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]
