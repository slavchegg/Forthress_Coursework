: abs dup 0 < if -1 * then ;
: rem 2 % abs ;
: parity rem not ;

: prime 
  dup 1 > if
    dup 2 > if
      1 >r
    	repeat  
        dup
        r> 1 + dup >r  
        % 0 =	 
      until
      r> =
	 else drop 1 then
  else drop 0 then ;

: primeallot prime 8 allot swap over ! ;
: .new . cr ;

( n primeallot c@ .new)

: inc 1 + ;
: concat 
  swap dup count >r over count r@
  + inc heap-alloc
  dup rot string-copy
  r> over >r
  + swap string-copy r> ;

( m" Hello, " m" Igor Olegovich!" concat .S dup prints m" How are you?" over prints )

: .space . ."  " ;

: coll 
  dup >r
  repeat
		dup 1 > if
      dup 2 % if
        dup 3 * inc
      else dup 2 / then
   	else 1 then dup 1 =
  until
  r> ;

: .until  
  >r
  repeat
   	dup .space r@ =
  until
  cr r> drop ;

( n coll .until )
