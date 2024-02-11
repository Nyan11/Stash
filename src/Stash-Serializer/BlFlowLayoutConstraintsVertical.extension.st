Extension { #name : #BlFlowLayoutConstraintsVertical }

{ #category : #'*Stash-Serializer' }
BlFlowLayoutConstraintsVertical >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start vertical ifFalse: [
		settersAndGetters add: [ :n |
			self alignment = BlElementAlignment vertical center
				ifTrue: [ #alignCenter ]
				ifFalse: [ #alignBottom ] ] onlySetOnStash ].

	^ settersAndGetters
]
