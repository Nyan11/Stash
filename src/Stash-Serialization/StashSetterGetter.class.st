Class {
	#name : #StashSetterGetter,
	#superclass : #StashProperty,
	#traits : 'TStashPropertySetter + TStashPropertyGetter',
	#classTraits : 'TStashPropertySetter classTrait + TStashPropertyGetter classTrait',
	#category : #'Stash-Serialization-stash'
}

{ #category : #testing }
StashSetterGetter >> isMultiArguments [

	^ self context value isString not and: [ self context value isCollection ]
]
