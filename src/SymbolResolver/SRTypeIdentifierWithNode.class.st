Class {
	#name : #SRTypeIdentifierWithNode,
	#superclass : #SRIdentifierWithNode,
	#instVars : [
		'typedVariables'
	],
	#category : #'SymbolResolver-Core'
}

{ #category : #adding }
SRTypeIdentifierWithNode >> addTypedVariable: aFamixPWBEntity [
	self typedVariables add: aFamixPWBEntity
]

{ #category : #converting }
SRTypeIdentifierWithNode >> asSREntityScope [ 
	^SRNullScope new
]

{ #category : #accessing }
SRTypeIdentifierWithNode >> entity: anObject [
	entity := anObject.
	typedVariables do: [ :each | each updateType: entity ]
]

{ #category : #resolution }
SRTypeIdentifierWithNode >> initialize [
	super initialize.
	typedVariables := OrderedCollection new
]

{ #category : #accessing }
SRTypeIdentifierWithNode >> typedVariables [
	^ typedVariables
]
