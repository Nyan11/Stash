Extension { #name : #BlMatrixTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlMatrixTransformation >> stashAccessors [

	<stashAccessors>
	^ { ([ :transform |
	   'matrix: (<1s>)' expandMacrosWith:
		   transform matrix asStashContructor ] -> self) onlySetOnStash }
]
