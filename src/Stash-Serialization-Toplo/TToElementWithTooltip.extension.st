Extension { #name : #TToElementWithTooltip }

{ #category : #'*Stash-Serialization-Toplo' }
TToElementWithTooltip >> allSetterAndGettersOfTraitForMyStash: aToElement [

	self hasTooltip ifFalse: [ ^ {  } ].
	^ { #tooltipBuilder. #closeTooltipWindowOnMouseLeave . #tooltipPopupDelay }
]
