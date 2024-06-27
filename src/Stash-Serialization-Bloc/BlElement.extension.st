Extension { #name : 'BlElement' }

{ #category : '*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self allSetterAndGettersForMyStashChildren: settersAndGetters.
	self allSetterAndGettersForMyStashUserData: settersAndGetters.
	self allSetterAndGettersForMyStashVisuals: settersAndGetters.
	self allSetterAndGettersForMyStashLayout: settersAndGetters.
	self allSetterAndGettersForMyStashConstraints: settersAndGetters.
	self allSetterAndGettersForMyStashTransformation: settersAndGetters.

	settersAndGetters addAll: self allSetterAndGettersForMyStashForMyTraits.

	^ settersAndGetters
]

{ #category : '*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashChildren: settersAndGetters [

	self children ifNotEmpty: [
		settersAndGetters add: #addChildren: -> #children ].
	
]

{ #category : '*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashConstraints: settersAndGetters [

	(constraints allSetterAndGettersForMyStash) ifNotEmpty: [
		settersAndGetters add: #constraintsDo: -> #constraints ]
]

{ #category : '*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashLayout: settersAndGetters [

	self layout == self defaultLayout ifFalse: [
		settersAndGetters add: #layout ].
	
]

{ #category : '*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashTransformation: settersAndGetters [

	self transformation isIdentity ifFalse: [
		settersAndGetters add: #transformDo: -> #transformation ]
]

{ #category : '*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashUserData: settersAndGetters [

	self userData associationsDo: [ :asso |
		(StashBlElementUserData uniqueInstance setterAndGetterBlockFor:
			 asso key) ifNotNil: [ :block | 
			settersAndGetters addAll: (block value: asso value)  ] ]
]

{ #category : '*Stash-Serialization-Bloc' }
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
