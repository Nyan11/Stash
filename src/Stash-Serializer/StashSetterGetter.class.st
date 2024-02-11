Class {
	#name : #StashSetterGetter,
	#superclass : #StashProperty,
	#traits : 'TStashPropertySetter + TStashPropertyGetter',
	#classTraits : 'TStashPropertySetter classTrait + TStashPropertyGetter classTrait',
	#category : #'Stash-Serializer-stash'
}

{ #category : #testing }
StashSetterGetter >> isStashGetter [

	^ true
]

{ #category : #testing }
StashSetterGetter >> isStashSetter [

	^ true
]
