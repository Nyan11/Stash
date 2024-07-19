Extension { #name : 'TToElementWithLabeledIcon' }

{ #category : '*Stash-Serialization-Toplo' }
TToElementWithLabeledIcon >> allSetterAndGettersOfTraitForMyStash: aToElement [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	aToElement isStartToEnd ifTrue: [ settersAndGetters add: (#beStartToEnd -> nil) onlySetOnStash ].
	aToElement isEndToStart ifTrue: [ settersAndGetters add: (#beEndToStart -> nil) onlySetOnStash ].
	
	aToElement isVertical ifTrue: [ settersAndGetters add: (#isVertical -> nil) onlySetOnStash ].
	aToElement isHorizontal ifTrue: [ settersAndGetters add: (#isHorizontal -> nil) onlySetOnStash ].
	
	settersAndGetters add: #endAlignment.
	settersAndGetters add: #endElement.
	settersAndGetters add: #endInterspace.
	settersAndGetters add: #flexible.
	settersAndGetters add: #icon.
	settersAndGetters add: #iconContainerHeight.
	settersAndGetters add: #iconContainerWidth.
	settersAndGetters add: #label.
	settersAndGetters add: #startAlignment.
	settersAndGetters add: #startInterspace.
	^ settersAndGetters
]
