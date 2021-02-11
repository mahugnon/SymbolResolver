Class {
	#name : #SRNullScope,
	#superclass : #SRScope,
	#category : #'SymbolResolver-Scopes'
}

{ #category : #accessing }
SRNullScope >> entity: anEntity [
]

{ #category : #'as yet unclassified' }
SRNullScope >> isCurrentEntity: aBoolean [
]

{ #category : #testing }
SRNullScope >> isNullPatternObject [
	^true
]

{ #category : #accessing }
SRNullScope >> reachableEntitiesOwned [
	^ #()
]
