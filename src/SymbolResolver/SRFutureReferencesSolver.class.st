"
I am a reference solver that does not directly resolve stuff but store all the resolution it will have to do and then resolve everything when #resolveUnresolvedReferences is called
"
Class {
	#name : #SRFutureReferencesSolver,
	#superclass : #SRReferencesSolver,
	#instVars : [
		'toResolve'
	],
	#category : #'SymbolResolver-Solver'
}

{ #category : #accessing }
SRFutureReferencesSolver >> initialize [ 
	super initialize.
	self toResolve: OrderedCollection new
]

{ #category : #accessing }
SRFutureReferencesSolver >> resolve: aChainOfIdentifiers [
	self toResolve
		addLast:
			(SRReferenceToResolve
				newFromScopes: self scopes
				identifiers: aChainOfIdentifiers)
]

{ #category : #accessing }
SRFutureReferencesSolver >> resolveImmediately: aChainOfIdentifiers [
	^ super resolve: aChainOfIdentifiers 
]

{ #category : #resolution }
SRFutureReferencesSolver >> resolveUnresolvedReferences [
	self toResolve
		do: #resolve
		displayingProgress: 'References resolution'
]

{ #category : #accessing }
SRFutureReferencesSolver >> toResolve [
	^ toResolve
]

{ #category : #accessing }
SRFutureReferencesSolver >> toResolve: anObject [
	toResolve := anObject
]
