Extension { #name : 'BlFlowLayout' }

{ #category : '*Stash-Serialization-Bloc' }
BlFlowLayout >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	(verticalAlignment == self defaultVerticalAlignment and: [
		 horizontalAlignment == self defaultHorizontalAlignment ]) ifFalse: [
		settersAndGetters addAll: self allSetterAndGettersForMyStashForMyTraits ].
	self direction == self defaultDirection ifFalse: [
		settersAndGetters add: #direction ].
	^ settersAndGetters
]

{ #category : '*Stash-Serialization-Bloc' }
BlFlowLayout >> asStashContructor [

	self orientation isVertical ifTrue: [ ^ 'BlFlowLayout vertical' ].
	^ 'BlFlowLayout horizontal'
]
