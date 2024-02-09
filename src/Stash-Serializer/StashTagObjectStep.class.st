Class {
	#name : #StashTagObjectStep,
	#superclass : #StashStep,
	#category : #'Stash-Serializer-stash'
}

{ #category : #actions }
StashTagObjectStep >> runOn: aStash [

	aStash identityDictionary do: [ :each |
		each shouldBeTagged ifTrue: [ aStash addTaggedObject: each ] ]
]
