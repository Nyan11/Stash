Class {
	#name : #StashTestOnlySet3,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #initialization }
StashTestOnlySet3 >> initialize [

	state := false.
]

{ #category : #'as yet unclassified' }
StashTestOnlySet3 >> stashAccessors [

	<stashAccessors>

	self state ifFalse: [ ^ {  } ].
	self state ifTrue: [ ^ { #stateTrue onlySetOnStash } ].
	^ { [ :testObject |
	  testObject state
		  ifTrue: [ #stateTrue ]
		  ifFalse: [ #stateFalse ] ] onlySetOnStash }
]

{ #category : #accessing }
StashTestOnlySet3 >> state [

	^ state
]

{ #category : #'as yet unclassified' }
StashTestOnlySet3 >> stateFalse [

	state := false
]

{ #category : #'as yet unclassified' }
StashTestOnlySet3 >> stateTrue [

	state := true.
]
