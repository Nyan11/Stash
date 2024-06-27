Extension { #name : 'BlProportionalLayoutConstraintsHorizontal' }

{ #category : '*Stash-Serialization-Bloc' }
BlProportionalLayoutConstraintsHorizontal >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self left = 0 ifFalse: [
		settersAndGetters add:
			[ :e | 'left: ' , self left printString ] onlySetOnStash ].
	self right = 1 ifFalse: [
		settersAndGetters add:
			[ :e | 'right: ' , self right printString ] onlySetOnStash ].

	^ settersAndGetters
]
