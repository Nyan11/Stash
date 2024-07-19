Extension { #name : #BlBorder }

{ #category : #'*Stash-Serialization-Bloc' }
BlBorder >> asStashObject [

	^ StashObjectWithBuilder new
		  builder: BlBorderBuilder new;
		methodToBuild: #build;
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serialization-Bloc' }
BlBorder >> stashAccessors [

	<stashAccessors>
	| defaults settersAndGetters |
	settersAndGetters := OrderedCollection new.
	defaults := BlBorderBuilder new.
	self paint = defaults defaultPaint ifFalse: [
		settersAndGetters add: #paint ].
	self width = defaults defaultWidth ifFalse: [
		settersAndGetters add: #width ].
	self style lineCap = defaults defaultLineCap ifFalse: [
		settersAndGetters add:
			#lineCap: -> [ :border | border style lineCap ] ].
	self style lineJoin = defaults defaultLineJoin ifFalse: [
		settersAndGetters add: #lineJoin: -> 
			[ :border | border style lineJoin ]   ].
	self style miterLimit = defaults defaultMiterLimit ifFalse: [
		settersAndGetters add:
			#miterLimit: -> [ :border | border style miterLimit ]  ].
	self style dashArray = defaults defaultDashArray ifFalse: [
		settersAndGetters add:
			#dashArray: -> [ :border | border style dashArray ] ].
	self style dashOffset = defaults defaultDashOffset ifFalse: [
		settersAndGetters add:
			#dashOffset: -> [ :border | border style dashOffset ] ].
	self opacity = defaults defaultOpacity ifFalse: [
		settersAndGetters add: #opacity ].

	^ settersAndGetters
]
