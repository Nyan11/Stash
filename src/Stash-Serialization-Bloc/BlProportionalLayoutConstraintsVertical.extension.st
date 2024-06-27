Extension { #name : #BlProportionalLayoutConstraintsVertical }

{ #category : #'*Stash-Serialization-Bloc' }
BlProportionalLayoutConstraintsVertical >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self top = 0 ifFalse: [
		settersAndGetters add:
			[ :e | 'top: ' , self top printString ] onlySetOnStash ].
	self bottom = 1 ifFalse: [
		settersAndGetters add:
			[ :e | 'bottom: ' , self bottom printString ] onlySetOnStash ].

	^ settersAndGetters
]
