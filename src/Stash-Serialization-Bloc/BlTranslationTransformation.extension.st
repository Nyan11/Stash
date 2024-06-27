Extension { #name : 'BlTranslationTransformation' }

{ #category : '*Stash-Serialization-Bloc' }
BlTranslationTransformation >> allSetterAndGettersForMyStash [

	^ { ([ :transform |
	  'translateBy: <1s> @ <2s>'
		  expandMacrosWith: transform translation x asStashContructor
		  with: transform translation y asStashContructor ] -> self) onlySetOnStash }
]
