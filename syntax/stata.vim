" stata.vim -- Vim syntax file for Stata do and ado files.
" Language:	Stata
" Maintainer:	Jeff Pitblado <jspitblado@yahoo.com>
" Version:	1.0.5
" Last Change:	08oct2002
" Location:	http://www.stata.com/users/jpitblado/files/vimfiles/syntax/stata.vim

if exists("did_stata_syntax_inits")
	finish
endif
let did_stata_syntax_inits = 1

syntax clear
syntax case match

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Identifiers and Keywords

" Official Stata commands
syn keyword stCommand about
syn keyword stCommand adopath
syn keyword stCommand args
syn keyword stCommand assert
syn keyword stCommand break nobreak
syn keyword stCommand cap[ture]
syn keyword stCommand char
syn keyword stCommand cluster
syn keyword stCommand collapse
syn keyword stCommand compress
syn keyword stCommand conf[irm]
syn keyword stCommand continue
syn keyword stCommand cou[nt]
syn keyword stCommand #delimit
syn keyword stCommand d[escribe]
syn keyword stCommand destring
syn keyword stCommand discard
syn keyword stCommand di[splay]
syn keyword stCommand egen
syn keyword stCommand end
syn keyword stCommand eret[urn]
syn keyword stCommand err[or]
syn keyword stCommand est[imates]
syn keyword stCommand e[xit]
syn keyword stCommand g[enerate]
syn keyword stCommand gettoken
syn keyword stCommand gl[obal]
syn keyword stCommand hexdump
syn keyword stCommand la[bel]
syn keyword stCommand loc[al]
syn keyword stCommand ma[cro]
syn keyword stCommand mark
syn keyword stCommand markout
syn keyword stCommand marksample
syn keyword stCommand matrix
syn keyword stCommand more
syn keyword stCommand n[oisily]
syn keyword stCommand note[s]
syn keyword stCommand pause
syn keyword stCommand post
syn keyword stCommand postclose
syn keyword stCommand postfile
syn keyword stCommand _predict
syn keyword stCommand preserve
syn keyword stCommand pr[ogram]
syn keyword stCommand q[uery]
syn keyword stCommand qui[etly]
syn keyword stCommand recast
syn keyword stCommand reg[ress]
syn keyword stCommand replace
syn keyword stCommand ret[urn]
syn keyword stCommand _rmcoll
syn keyword stCommand sca[lar]
syn keyword stCommand set
syn keyword stCommand sleep
syn keyword stCommand sret[urn]
syn keyword stCommand st
syn keyword stCommand syntax
syn keyword stCommand sysdir
syn keyword stCommand tabdisp
syn keyword stCommand token[ize]
syn keyword stCommand tsrevar
syn keyword stCommand tsunab
syn keyword stCommand unab
syn keyword stCommand vers[ion]
syn keyword stCommand which
syn keyword stCommand window

" Standard options
syn keyword stOption break
syn keyword stOption byable
syn keyword stOption clear
syn keyword stOption replace
syn keyword stOption sort[preserve]
syn keyword stOption using

" Brute force Stata function definitions
" Math
syn keyword stFunction abs
syn keyword stFunction acos
syn keyword stFunction asin
syn keyword stFunction atan
syn keyword stFunction comb
syn keyword stFunction cos
syn keyword stFunction digamma
syn keyword stFunction exp
syn keyword stFunction ln
syn keyword stFunction lnfact
syn keyword stFunction lngamma
syn keyword stFunction log
syn keyword stFunction log10
syn keyword stFunction mod
syn keyword stFunction sin
syn keyword stFunction sqrt
syn keyword stFunction tan
syn keyword stFunction trigamma
" Statistical
syn keyword stFunction Binomial
syn keyword stFunction binorm
syn keyword stFunction chi2
syn keyword stFunction chi2tail
syn keyword stFunction F
syn keyword stFunction Ftail
syn keyword stFunction gammap
syn keyword stFunction ibeta
syn keyword stFunction invbinomial
syn keyword stFunction invchi2
syn keyword stFunction invchi2tail
syn keyword stFunction invF
syn keyword stFunction invFtail
syn keyword stFunction invgammap
syn keyword stFunction invnchi2
syn keyword stFunction invnorm
syn keyword stFunction invttail
syn keyword stFunction nchi2
syn keyword stFunction normden
syn keyword stFunction normden
syn keyword stFunction norm
syn keyword stFunction npnchi2
syn keyword stFunction ttail
" Random numbers
syn keyword stFunction uniform
" String
syn keyword stFunction abbrev
syn keyword stFunction index
syn keyword stFunction length
syn keyword stFunction lower
syn keyword stFunction ltrim
syn keyword stFunction match
syn keyword stFunction real
syn keyword stFunction reverse
syn keyword stFunction rtrim
syn keyword stFunction string
syn keyword stFunction string
syn keyword stFunction subinstr
syn keyword stFunction subinword
syn keyword stFunction substr
syn keyword stFunction trim
syn keyword stFunction upper
" Special
syn keyword stFunction autocode
syn keyword stFunction _caller
syn keyword stFunction cond
syn keyword stFunction e
syn keyword stFunction float
syn keyword stFunction group
syn keyword stFunction inlist
syn keyword stFunction inrange
syn keyword stFunction int
syn keyword stFunction matrix
syn keyword stFunction max
syn keyword stFunction min
syn keyword stFunction missing
syn keyword stFunction r
syn keyword stFunction recode
syn keyword stFunction reldif
syn keyword stFunction replay
syn keyword stFunction return
syn keyword stFunction round
syn keyword stFunction s
syn keyword stFunction scalar
syn keyword stFunction sign
syn keyword stFunction sum
" Date
syn keyword stFunction date
syn keyword stFunction d
syn keyword stFunction mdy
syn keyword stFunction day
syn keyword stFunction month
syn keyword stFunction year
syn keyword stFunction dow
syn keyword stFunction doy
syn keyword stFunction week
syn keyword stFunction quarter
syn keyword stFunction halfyear
" Time-series
syn keyword stFunction daily
syn keyword stFunction weekly
syn keyword stFunction monthly
syn keyword stFunction quarterly
syn keyword stFunction halfyearly
syn keyword stFunction yearly
syn keyword stFunction yw
syn keyword stFunction ym
syn keyword stFunction yq
syn keyword stFunction yh
syn keyword stFunction d
syn keyword stFunction w
syn keyword stFunction m
syn keyword stFunction q
syn keyword stFunction h
syn keyword stFunction y
syn keyword stFunction dofd
syn keyword stFunction dofw
syn keyword stFunction dofm
syn keyword stFunction dofq
syn keyword stFunction dofh
syn keyword stFunction dofy
syn keyword stFunction wofd
syn keyword stFunction mofd
syn keyword stFunction qofd
syn keyword stFunction hofd
syn keyword stFunction yofd
syn keyword stFunction tin
syn keyword stFunction twithin
" Matrix
syn keyword stFunction mreldif
syn keyword stFunction trace
syn keyword stFunction det
syn keyword stFunction diag0cnt
syn keyword stFunction rowsof
syn keyword stFunction colsof
syn keyword stFunction rownumb
syn keyword stFunction colnumb
syn keyword stFunction el

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Special
" numeric formats
syn match  stFormat /%-\=\d\+\.\d\+[efg]c\=\s/
" numeric hex format
syn match  stFormat /%-\=21x\s/
" string format
syn match  stFormat /%-\=\d\+s\s/
" date formats						!! to be written
" time-series formats					!! to be written
hi link stFormat stSpecial

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statements
syn keyword stConditional else if
syn keyword stRepeat      for
syn keyword stRepeat      foreach
syn keyword stRepeat      forv[alues]
syn keyword stRepeat      while

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comments - single line
syn region stStarComment  start=/^\s*\*/ end=/$/    contains=stComment oneline
syn region stSlashComment start="\s//"   end=/$/    contains=stComment oneline
syn region stSlashComment start="^//"   end=/$/    contains=stComment oneline
" comments - multiple line
syn region stComment      start="/\*"    end="\*/"  contains=stComment
hi link stStarComment  stComment
hi link stSlashComment stComment

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PreProc
" dereferenced macros
" global macros - simple case
syn match  stGlobal /\$\a\w*/
" global macros - general case
syn region stGlobal start=/\${/ end=/}/ oneline contains=@stMacroGroup
" local macros - general case
syn region stLocal  start=/`/ end=/'/   oneline contains=@stMacroGroup
syn cluster stMacroGroup contains=stGlobal,stLocal
hi link stGlobal stMacro
hi link stLocal  stMacro

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Literals
syn region stString  matchgroup=Nothing start=/"/ end=/"/   oneline contains=@stMacroGroup
syn region stEString matchgroup=Nothing start=/`"/ end=/"'/ oneline contains=@stMacroGroup,stEString
hi link stEString stString

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Errors to catch
" taken from $VIMRUNTIME/syntax/c.vim 
" catch errors caused by wrong parenthesis, braces and brackets
syn cluster	stParenGroup	contains=stParenError,stBracketError,stBraceError,stSpecial,stFormat
syn region	stParen		transparent start=/(/ end=/)/  contains=ALLBUT,@stParenGroup,stErrInBracket,stErrInBrace
syn region	stBracket	transparent start=/\[/ end=/]/ contains=ALLBUT,@stParenGroup,stErrInParen,stErrInBrace
syn region	stBrace		transparent start=/{/ end=/}/  contains=ALLBUT,@stParenGroup,stErrInParen,stErrInBracket
syn match	stParenError	/[\])}]/
syn match	stBracketError	/]/
syn match	stBraceError	/}/
syn match	stErrInParen	contained /[\]{}]/
syn match	stErrInBracket	contained /[){}]/
syn match	stErrInBrace	contained /[)\]]/
hi link stParenError   stError
hi link stBracketError stError
hi link stBraceError   stError
hi link stErrInParen   stError
hi link stErrInBracket stError
hi link stErrInBrace   stError

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" assign highlight groups
" *Comment        any comment
hi link stComment		Comment

" *Constant       any constant
"  String         a string constant: "this is a string"
"  Character      a character constant: 'c', '\n'
"  Number         a number constant: 234, 0xff
"  Boolean        a boolean constant: TRUE, false
"  Float          a floating point constant: 2.3e10
hi link stString		String

" *Identifier     any variable name
"  Function       function name (also: methods for classes)
hi link stFunction		Function

" *Statement      any statement
"  Conditional    if, then, else, endif, switch, etc.
"  Repeat         for, do, while, etc.
"  Label          case, default, etc.
"  Operator       "sizeof", "+", "*", etc.
"  Keyword        any other keyword
"  Exception      try, catch, throw
hi link stConditional		Conditional
hi link stRepeat		Repeat

" *PreProc        generic Preprocessor
"  Include        preprocessor #include
"  Define         preprocessor #define
"  Macro          same as Define
"  PreCondit      preprocessor #if, #else, #endif, etc.
hi link stCommand		Define
hi link stMacro			Define

" *Type           int, long, char, etc.
"  StorageClass   static, register, volatile, etc.
"  Structure      struct, union, enum, etc.
"  Typedef        A typedef

" *Special        any special symbol
"  SpecialChar    special character in a constant
"  Tag            you can use CTRL-] on this
"  Delimiter      character that needs attention
"  SpecialComment special things inside a comment
"  Debug          debugging statements
hi link stSpecial		SpecialChar

" *Ignore         left blank, hidden

" *Error          any erroneous construct
hi link stError			Error

" *Todo           anything that needs extra attention; mostly the
"                 keywords TODO FIXME and XXX

let b:current_syntax = "stata"

" vim: ts=8
