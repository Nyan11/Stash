Extension { #name : #BlElement }

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self allSetterAndGettersForMyStashChildren: settersAndGetters.
	self allSetterAndGettersForMyStashUserData: settersAndGetters.
	self allSetterAndGettersForMyStashVisuals: settersAndGetters.
	self allSetterAndGettersForMyStashLayout: settersAndGetters.
	self allSetterAndGettersForMyStashConstraints: settersAndGetters.
	self allSetterAndGettersForMyStashTransformation: settersAndGetters.

	^ settersAndGetters
]

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStashChildren: settersAndGetters [

	self children ifNotEmpty: [
		settersAndGetters add: #addChildren: -> #children ].
	
]

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStashConstraints: settersAndGetters [

	(constraints allSetterAndGettersForMyStash) ifNotEmpty: [
		settersAndGetters add: #constraintsDo: -> #constraints ]
]

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStashLayout: settersAndGetters [

	self layout == self defaultLayout ifFalse: [
		settersAndGetters add: #layout ].
	
]

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStashTransformation: settersAndGetters [

	self transformation isIdentity ifFalse: [
		settersAndGetters add: #transformDo: -> #transformation ]
]

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStashUserData: settersAndGetters [

	self id == nil ifFalse: [
		settersAndGetters add: #id ]
]

{ #category : #'*Stash-Serializer' }
BlElement >> allSetterAndGettersForMyStashVisuals: settersAndGetters [

	self background == BlElementVisuals defaultBackground ifFalse: [
		settersAndGetters add: #background ].
	self border == BlElementVisuals defaultBorder ifFalse: [
		settersAndGetters add: #border ].
	self geometry == BlElementVisuals defaultGeometry ifFalse: [
		settersAndGetters add: #geometry ].
	self effect == (BlElementVisuals classPool at: #DefaultEffect)
		ifFalse: [ settersAndGetters add: #effect ].
	self opacity == (BlElementVisuals classPool at: #DefaultOpacity)
		ifFalse: [ settersAndGetters add: #opacity ].
	self visibility
	== (BlElementVisuals classPool at: #DefaultVisibility) ifFalse: [
		settersAndGetters add: #visibility ].
	self outskirts == (BlElementVisuals classPool at: #DefaultOutskirts)
		ifFalse: [ settersAndGetters add: #outskirts ].
	self clipChildren
	== (BlElementVisuals classPool at: #DefaultClipChildren) ifFalse: [
		settersAndGetters add: #clipChildren ].
	self focusability
	== (BlElementVisuals classPool at: #DefaultFocusability) ifFalse: [
		settersAndGetters add: #focusability ].
	self elevation == (BlElementVisuals classPool at: #DefaultElevation)
		ifFalse: [ settersAndGetters add: #elevation ].
	self focused == (BlElementVisuals classPool at: #DefaultFocused)
		ifFalse: [ settersAndGetters add: #focused ].
	self mouseCursor
	== (BlElementVisuals classPool at: #DefaultMouseCursor) ifFalse: [
		settersAndGetters add: #mouseCursor ].

]
