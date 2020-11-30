Extension { #name : #PWBNullEntityObject }

{ #category : #'*SymbolResolver' }
PWBNullEntityObject >> asSREntityScope [
	^ SREntityScope new
		entity: self;
		yourself
]
