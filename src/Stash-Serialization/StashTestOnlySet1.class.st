Class {
	#name : #StashTestOnlySet1,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #initialization }
StashTestOnlySet1 >> initialize [

	state := false
]

{ #category : #'as yet unclassified' }
StashTestOnlySet1 >> stashAccessors [

	<stashAccessors>
	^ { ([ :testObject |
	   testObject state
		   ifTrue: [ #stateTrue ]
		   ifFalse: [ #stateFalse ] ] -> self) onlySetOnStash }
]

{ #category : #accessing }
StashTestOnlySet1 >> state [

	^ state
]

{ #category : #'as yet unclassified' }
StashTestOnlySet1 >> stateFalse [

	state := false
]

{ #category : #'as yet unclassified' }
StashTestOnlySet1 >> stateTrue [

	state := true
]
