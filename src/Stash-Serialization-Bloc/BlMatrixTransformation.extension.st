Extension { #name : #BlMatrixTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlMatrixTransformation >> allSetterAndGettersForMyStash [

	^ { ([ :transform |
	   'matrix: (<1s>)' expandMacrosWith:
		   transform matrix asStashContructor ] -> self) onlySetOnStash }
]
