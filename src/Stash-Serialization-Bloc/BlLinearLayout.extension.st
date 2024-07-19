Extension { #name : #BlLinearLayout }

{ #category : #'*Stash-Serialization-Bloc' }
BlLinearLayout >> allSetterAndGettersForMyStash [

	"We ovverride this method to take into account the default value of alignment"
	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	(verticalAlignment == self defaultVerticalAlignment and: [
		 horizontalAlignment == self defaultHorizontalAlignment ]) ifFalse: [
		settersAndGetters addAll: self allSetterAndGettersForMyStashForMyTraits ].
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

{ #category : #'*Stash-Serialization-Bloc' }
BlLinearLayout >> asStashContructor [

	self isVertical ifTrue: [ ^ 'BlLinearLayout vertical' ].
	^ 'BlLinearLayout horizontal' 
]
