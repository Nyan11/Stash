Class {
	#name : #StashBlLayoutConstraints,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

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
StashBlLayoutConstraints >> nextHorizontalSettersAndInstances [

	^ self object horizontal allSetterAndGettersForMyStash collect: [
		  :each |

				  'horizontal ' , each setter
				  -> (self getInstanceForHorizontalWith: each value) 
			   ]
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> nextInstances [

	^ super nextInstances, { self object horizontal . self object vertical } 
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> nextSettersAndInstances [

	^ self nextHorizontalSettersAndInstances , self nextVerticalSettersAndInstances , super nextSettersAndInstances
]

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> nextVerticalSettersAndInstances [


	^ self object vertical allSetterAndGettersForMyStash collect: [
		  :each |
		  'vertical ' , each setter
		  -> (self getInstanceForVerticalWith: each value) ]
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
