Extension { #name : #BlShearTransformation }

{ #category : #'*Stash-Serializer' }
BlShearTransformation >> allSetterAndGettersForMyStash [

	self coefficient = (0 @ 0) ifTrue: [
		^ {[ :e | 'shearBy: 0 @ 0' ] onlySetOnStash} ].
	self coefficient x = 0 ifTrue: [
		^ {[ :e |
		  'skewY: <1p>' expandMacrosWith:
			  self coefficient y negated arcTan radiansToDegrees ]
			  onlySetOnStash} ].
	self coefficient y = 0 ifTrue: [
		^ {[ :e |
		  'skewX: <1p>' expandMacrosWith:
			  self coefficient x negated arcTan radiansToDegrees ]
			  onlySetOnStash} ].
	^ {[ :e |
	  'shearBy: <1p> @ <2p>'
		  expandMacrosWith: self coefficient x
		  with: self coefficient y ] onlySetOnStash}
]
