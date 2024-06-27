Extension { #name : 'TToElementWithLabeledIcon' }

{ #category : '*Stash-Serialization-Toplo' }
TToElementWithLabeledIcon >> allSetterAndGettersOfTraitForMyStash: aToElement [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	settersAndGetters add: ([ :testObject |
		 testObject isHorizontal
			 ifTrue: [ #beHorizontal ]
			 ifFalse: [ #beVerical ] ] -> self) onlySetOnStash.
	settersAndGetters add: ([ :testObject |
		 testObject isIconFirst
			 ifTrue: [ #beIconFirst ]
			 ifFalse: [ #beLabelFirst ] ] -> self) onlySetOnStash.
	settersAndGetters add: (#flexible).
	settersAndGetters add: (#icon).
	settersAndGetters add: (#iconContainerHeight).
	settersAndGetters add: (#iconContainerWidth).
	settersAndGetters add: (#interspace).
	settersAndGetters add: (#label).
	^ settersAndGetters
]
