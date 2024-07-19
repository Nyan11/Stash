Extension { #name : #BlShearTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlShearTransformation >> stashAccessors [

	<stashAccessors>
	self coefficient = (0 @ 0) ifTrue: [
		^ { ([ :transform | 'shearBy: 0 @ 0' ] -> self) onlySetOnStash } ].
	self coefficient x = 0 ifTrue: [
		^ { ([ :transform |
		   'skewY: <1p>' expandMacrosWith:
			   transform coefficient y negated arcTan radiansToDegrees ]
		   -> self) onlySetOnStash } ].
	self coefficient y = 0 ifTrue: [
		^ { ([ :transform |
		   'skewX: <1p>' expandMacrosWith:
			   transform coefficient x negated arcTan radiansToDegrees ]
		   -> self) onlySetOnStash } ].
	^ { ([ :transform |
	   'shearBy: <1p> @ <2p>'
		   expandMacrosWith: transform coefficient x
		   with: transform coefficient y ] -> self) onlySetOnStash }
]
