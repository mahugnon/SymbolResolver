Extension { #name : #FamixPWBEntity }

{ #category : #'*SymbolResolver' }
FamixPWBEntity >> asSREntityScope [
	^SREntityScope new
		entity: self ;
		yourself
]

{ #category : #'*SymbolResolver' }
FamixPWBEntity >> isResolvable [
	^ false
]

{ #category : #'*SymbolResolver' }
FamixPWBEntity >> postResolveActionWith: aSRResolver [
"By default do nothing"
]
