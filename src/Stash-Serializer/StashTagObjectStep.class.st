Class {
	#name : #StashTagObjectStep,
	#superclass : #StashStep,
	#category : #'Stash-Serializer-stash-steps'
}

{ #category : #actions }
StashTagObjectStep >> runOn: aStash [

	aStash identityDictionary do: [ :each |
		each shouldBeTagged ifTrue: [ aStash addTaggedObject: each ] ]
]
