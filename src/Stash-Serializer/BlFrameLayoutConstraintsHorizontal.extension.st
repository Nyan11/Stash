Extension { #name : #BlFrameLayoutConstraintsHorizontal }

{ #category : #'*Stash-Serializer' }
BlFrameLayoutConstraintsHorizontal >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add: [ :e | self alignment asStashSelector ] onlySetOnStash].

	self weight == 1.0 ifFalse: [ settersAndGetters add: #weight ].

	^ settersAndGetters
]
