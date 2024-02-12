Class {
	#name : #StashBlLayoutConstraints,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> allHorizontalSetters [

	^ self object horizontal allSetterAndGettersForMyStash collect: [ :each | each asStashProperty ] thenSelect: [ :each |
		  each isStashSetter ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> allHorizontalSettersFor: aLayoutConstraints [

	^ aLayoutConstraints horizontal allSetterAndGettersForMyStash
		  collect: [ :each | each asStashProperty ]
		  thenSelect: [ :each | each isStashSetter ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> allLayoutSettersAndNames [

	| layouts |
	layouts := { #flow. #frame. #grid. #linear. #proportional . #relative. #zoomable }.
	^ layouts collect: [ :layout |
		  layout
		  -> ((self object perform: layout) allSetterAndGettersForMyStash
				   collect: [ :each | each asStashProperty ]
				   thenSelect: [ :each | each isStashSetter ]) ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> allVerticalSetters [

	^ self object vertical allSetterAndGettersForMyStash
		  collect: [ :each | each asStashProperty ]
		  thenSelect: [ :each | each isStashSetter ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> allVerticalSettersFor: aLayoutConstraints [

	^ aLayoutConstraints vertical allSetterAndGettersForMyStash
		  collect: [ :each | each asStashProperty ]
		  thenSelect: [ :each | each isStashSetter ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructBlLayoutConstraints: self
		on: aStash
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> getInstanceForHorizontalWith: anObject [

	anObject setter isBlock
		ifTrue: [ ^ anObject setter value: self object horizontal ]
		ifFalse: [ ^ anObject setter ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> getInstanceForVerticalWith: anObject [

	anObject setter isBlock
		ifTrue: [ ^ anObject setter value: self object vertical ]
		ifFalse: [ ^ anObject setter ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> nextInstances [

	^ super nextInstances, { self object horizontal . self object vertical } 
]

{ #category : #accessing }
StashBlLayoutConstraints >> object: anObject [

	object := anObject.
	(anObject allSetterAndGettersForMyStash isEmpty and: [ anObject horizontal allSetterAndGettersForMyStash isEmpty and: [anObject vertical allSetterAndGettersForMyStash isEmpty  ] ]) ifTrue: [ self propertiesAreSet ]
]

{ #category : #asserting }
StashBlLayoutConstraints >> shouldBeTagged [

	^ false
]
