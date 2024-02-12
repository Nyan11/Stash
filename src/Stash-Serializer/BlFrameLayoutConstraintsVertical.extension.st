Extension { #name : #BlFrameLayoutConstraintsVertical }

{ #category : #'*Stash-Serializer' }
BlFrameLayoutConstraintsVertical >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self alignment = BlElementAlignment start vertical ifFalse: [
		settersAndGetters add:
			[ :e | self alignment asStashSelector ] onlySetOnStash ].

	self weight == 1.0 ifFalse: [
		settersAndGetters add:
			[ :e | 'weight: ' , self weight printString ] onlySetOnStash ].

	^ settersAndGetters
]
