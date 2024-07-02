Extension { #name : 'TBlAlignable' }

{ #category : '*Stash-Serialization-Bloc' }
TBlAlignable >> allSetterAndGettersOfTraitForMyStash: anObject [

	^ { ([ :alignement |
	   | val |
	   val := #alignNone.
	   alignement isAlignTopLeft ifTrue: [ val := #alignTopLeft ].
	   alignement isAlignTopCenter ifTrue: [ val := #alignTopCenter ].
	   alignement isAlignTopRight ifTrue: [ val := #alignTopRight ].
	   alignement isAlignCenterLeft ifTrue: [ val := #alignCenterLeft ].
	   alignement isAlignCenter ifTrue: [ val := #alignCenter ].
	   alignement isAlignCenterRight ifTrue: [ val := #alignCenterRight ].
	   alignement isAlignBottomLeft ifTrue: [ val := #alignBottomLeft ].
	   alignement isAlignBottomCenter ifTrue: [
		   val := #alignBottomCenter ].
	   alignement isAlignBottomRight ifTrue: [ val := #alignBottomRight ].
	   val ] -> self) onlySetOnStash }
]
