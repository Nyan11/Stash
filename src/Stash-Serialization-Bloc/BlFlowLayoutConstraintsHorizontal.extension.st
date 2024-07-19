Extension { #name : #BlFlowLayoutConstraintsHorizontal }

{ #category : #'*Stash-Serialization-Bloc' }
BlFlowLayoutConstraintsHorizontal >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add: [ :n |
			self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]
