Extension { #name : #BlLinearLayout }

{ #category : #'*Stash-Serializer' }
BlLinearLayout >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	(verticalAlignment == self defaultVerticalAlignment and: [
		 horizontalAlignment == self defaultHorizontalAlignment ]) ifFalse: [
		self allSetterAndGettersForMyStashAlignement: settersAndGetters ].
	cellSpacing == 0.0 ifFalse: [ settersAndGetters add: #cellSpacing ].
	interspace == 0.0 ifFalse: [ settersAndGetters add: #interspace ].
	self direction == self defaultDirection ifFalse: [
		settersAndGetters add: #direction ].
	shouldUseLargestChild ifTrue: [
		settersAndGetters add: ([ :linearLayout |
			 linearLayout shouldUseLargestChild
				 ifTrue: [ #withSpaceEqualization ]
				 ifFalse: [ #withoutSpaceEqualization ] ] -> self) onlySetOnStash ].
	weightSum == self defaultWeightSum ifFalse: [
		settersAndGetters add: #weightSum ].
	^ settersAndGetters
]

{ #category : #'*Stash-Serializer' }
BlLinearLayout >> asStashContructor [

	self isVertical ifTrue: [ ^ 'BlLinearLayout vertical' ].
	^ 'BlLinearLayout horizontal' 
]
