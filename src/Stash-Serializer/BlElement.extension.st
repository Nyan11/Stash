Extension { #name : #BlElement }

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self children ifNotEmpty: [
		settersAndGetters add: #addChildren: -> #children ].
	self background == BlElementVisuals defaultBackground ifFalse: [
		settersAndGetters add: #background: -> #background ].
	self border == BlElementVisuals defaultBorder ifFalse: [
		settersAndGetters add: #border: -> #border ].
	self geometry == BlElementVisuals defaultGeometry ifFalse: [
		settersAndGetters add: #geometry: -> #geometry ].
	self effect == (BlElementVisuals classPool at: #DefaultEffect)
		ifFalse: [ settersAndGetters add: #effect: -> #effect ].
	self opacity == (BlElementVisuals classPool at: #DefaultOpacity)
		ifFalse: [ settersAndGetters add: #opacity: -> #opacity ].
	self visibility == (BlElementVisuals classPool at: #DefaultVisibility)
		ifFalse: [ settersAndGetters add: #visibility: -> #visibility ].
	self outskirts == (BlElementVisuals classPool at: #DefaultOutskirts)
		ifFalse: [ settersAndGetters add: #outskirts: -> #outskirts ].
		self clipChildren == (BlElementVisuals classPool at: #DefaultClipChildren)
		ifFalse: [ settersAndGetters add: #clipChildren: -> #clipChildren ].
	self focusability == (BlElementVisuals classPool at: #DefaultFocusability)
		ifFalse: [ settersAndGetters add: #focusability: -> #focusability ].
	self elevation == (BlElementVisuals classPool at: #DefaultElevation)
		ifFalse: [ settersAndGetters add: #elevation: -> #elevation ].
		self focused == (BlElementVisuals classPool at: #DefaultFocused)
		ifFalse: [ settersAndGetters add: #focused: -> #focused ].
		self mouseCursor == (BlElementVisuals classPool at: #DefaultMouseCursor)
		ifFalse: [ settersAndGetters add: #mouseCursor: -> #mouseCursor ].
	^ settersAndGetters
]
