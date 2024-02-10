Class {
	#name : #StashBlocLayoutTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout1 [

	| object source newObject |
	object := BlElement new layout: BlFlowLayout vertical.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlFlowLayout vertical;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout orientation isVertical
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout10 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignBottomCenter.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignBottomCenter;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignBottomCenter
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout11 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignBottomRight.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignBottomRight;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignBottomRight
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout2 [

	| object source newObject |
	object := BlElement new layout: BlFlowLayout horizontal.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlFlowLayout horizontal;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout orientation isHorizontal
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout3 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignTopLeft.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlFlowLayout horizontal;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignTopLeft
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout4 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignTopCenter.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignTopCenter;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignTopCenter
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout5 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignTopRight.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignTopRight;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignTopRight
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout6 [

	| object source newObject |
	object := BlElement new layout: BlFlowLayout horizontal alignCenterLeft.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignCenterLeft;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignCenterLeft
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout7 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignCenter.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignCenter;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignCenter
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout8 [

	| object source newObject |
	object := BlElement new layout: BlFlowLayout horizontal alignCenterRight.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignCenterRight;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignCenterRight
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFlowLayout9 [

	| object source newObject |
	object := BlElement new layout:
		          BlFlowLayout horizontal alignBottomLeft.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlFlowLayout horizontal
         alignBottomLeft;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFlowLayout.
	self assert: newObject layout isAlignBottomLeft
]

{ #category : #tests }
StashBlocLayoutTest >> testBlFrameLayout [

	| object source newObject |
	object := BlElement new layout: BlFrameLayout new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlFrameLayout new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlFrameLayout
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout1 [

	| object source newObject |
	object := BlElement new layout: BlLinearLayout vertical.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlLinearLayout vertical;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 0.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout2 [

	| object source newObject |
	object := BlElement new layout: BlLinearLayout horizontal.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlLinearLayout horizontal;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isHorizontal.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 0.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout3 [

	| object source newObject |
	object := BlElement new layout:
		          (BlLinearLayout vertical cellSpacing: 3.0).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlLinearLayout vertical
         cellSpacing: 3.0;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 3.0.
	self assert: newObject layout interspace equals: 0.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout4 [

	| object source newObject |
	object := BlElement new layout:
		          (BlLinearLayout vertical interspace: 3.0).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlLinearLayout vertical
         interspace: 3.0;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 3.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout5 [

	| object source newObject |
	object := BlElement new layout: BlLinearLayout vertical leftToRight.
	source := Stash new serialize: object.
	self assert: source equals:'BlElement new
   layout: BlLinearLayout vertical;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 0.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout6 [

	| object source newObject |
	object := BlElement new layout: BlLinearLayout vertical rightToLeft.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlLinearLayout vertical
         direction: BlLayoutRightToLeft new;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 0.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout7 [

	| object source newObject |
	object := BlElement new layout:
		          (BlLinearLayout vertical withSpaceEqualization).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlLinearLayout vertical
         withSpaceEqualization;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 0.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlLinearLayout8 [

	| object source newObject |
	object := BlElement new layout:
		          (BlLinearLayout vertical weightSum: 800).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: (BlLinearLayout vertical
         weightSum: 800.0;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlLinearLayout.
	self assert: newObject layout isVertical.
	self assert: newObject layout cellSpacing equals: 0.0.
	self assert: newObject layout interspace equals: 0.0.
	self assert: newObject layout weightSum equals: 800.0
]

{ #category : #tests }
StashBlocLayoutTest >> testBlProportionalLayout [

	| object source newObject |
	object := BlElement new layout: (BlProportionalLayout new).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   layout: BlProportionalLayout new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject layout class equals: BlProportionalLayout
]
