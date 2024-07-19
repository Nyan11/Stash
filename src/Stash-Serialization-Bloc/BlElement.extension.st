Extension { #name : #BlElement }

{ #category : #'*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashChildren [

	<stashAccessors>
	self shouldSerializedChildren ifFalse: [ ^ {  } ].
	self children ifNotEmpty: [
		^ { #addChildren: -> #children } ].
	^ {  }
]

{ #category : #'*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashConstraints [

	<stashAccessors>
	(constraints allSetterAndGettersForMyStash) ifNotEmpty: [
		^ { #constraintsDo: -> #constraints } ].
	^ {  }
]

{ #category : #'*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashIdentifier [

	<stashAccessors>
	| elementId |
	self userData at: #elementId ifAbsent: [ ^ {  } ].
	elementId := self userData at: #elementId.
	elementId class = BlElementNoId ifTrue: [ ^ {  } ].
	elementId class = BlElementNamedId ifTrue: [ ^ { #id } ].
	^ { #elementId }
	
]

{ #category : #'*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashLayout [

	<stashAccessors>
	self layout == self defaultLayout ifFalse: [
		^ { #layout } ].
	^ {  }
	
]

{ #category : #'*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashTransformation [

	<stashAccessors>
	self transformation isIdentity ifFalse: [
		^ { #transformDo: -> #transformation } ].
	^ {  }
]

{ #category : #'*Stash-Serialization-Bloc' }
BlElement >> allSetterAndGettersForMyStashVisuals [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
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
	^ settersAndGetters

]
