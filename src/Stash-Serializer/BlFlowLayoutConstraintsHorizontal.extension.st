Extension { #name : #BlFlowLayoutConstraintsHorizontal }

{ #category : #'*Stash-Serializer' }
BlFlowLayoutConstraintsHorizontal >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add: [ :n | self alignment = BlElementAlignment horizontal center ifTrue: [ #alignCenter ] ifFalse: [ #alignRight ]  ] onlySetOnStash ].

	^ settersAndGetters
]
