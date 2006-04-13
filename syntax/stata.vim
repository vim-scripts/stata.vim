" stata.vim -- Vim syntax file for Stata do, ado, and class files.
" Language:	Stata and/or Mata
" Maintainer:	Jeff Pitblado <jpitblado@stata.com>
" Last Change:	14apr2006
" Location:	http://www.stata.com/users/jpitblado/files/vimfiles/syntax/stata.vim

if exists("did_stata_syntax_inits")
"	finish
endif
let did_stata_syntax_inits = 1

syntax clear
syntax case match

" comments - single line
" note that the triple slash continuing line comment comes free
syn region stStarComment  start=/^\s*\*/ end=/$/    contains=stComment oneline
syn region stSlashComment start="\s//"   end=/$/    contains=stComment oneline
syn region stSlashComment start="^//"    end=/$/    contains=stComment oneline
" comments - multiple line
syn region stComment      start="/\*"    end="\*/"  contains=stComment

" global macros - simple case
syn match  stGlobal /\$\a\w*/
" global macros - general case
syn region stGlobal start=/\${/ end=/}/ oneline contains=@stMacroGroup
" local macros - general case
syn region stLocal  start=/`/ end=/'/   oneline contains=@stMacroGroup

" numeric formats
syn match  stFormat /%-\=\d\+\.\d\+[efg]c\=/
" numeric hex format
syn match  stFormat /%-\=21x/
" string format
syn match  stFormat /%\(\|-\|\~\)\d\+s/

" Statements
syn keyword stConditional else if
syn keyword stRepeat      foreach
syn keyword stRepeat      forv[alues]
syn keyword stRepeat      while

" Common programming commands
syn keyword stCommand about
syn keyword stCommand adopath
syn keyword stCommand adoupdate
syn keyword stCommand assert
syn keyword stCommand break
syn keyword stCommand by
syn keyword stCommand cap[ture]
syn keyword stCommand cd
syn keyword stCommand chdir
syn keyword stCommand checksum
syn keyword stCommand class
syn keyword stCommand classutil
syn keyword stCommand compress
syn keyword stCommand conf[irm]
syn keyword stCommand conren
syn keyword stCommand continue
syn keyword stCommand cou[nt]
syn keyword stCommand cscript
syn keyword stCommand cscript_log
syn keyword stCommand #delimit
syn keyword stCommand d[escribe]
syn keyword stCommand dir
syn keyword stCommand discard
syn keyword stCommand di[splay]
syn keyword stCommand do
syn keyword stCommand doedit
syn keyword stCommand drop
syn keyword stCommand edit
syn keyword stCommand end
syn keyword stCommand erase
syn keyword stCommand eret[urn]
syn keyword stCommand err[or]
syn keyword stCommand e[xit]
syn keyword stCommand expand
syn keyword stCommand expandcl
syn keyword stCommand file
syn keyword stCommand findfile
syn keyword stCommand format
syn keyword stCommand g[enerate]
syn keyword stCommand gettoken
syn keyword stCommand gl[obal]
syn keyword stCommand help
syn keyword stCommand hexdump
syn keyword stCommand include
syn keyword stCommand infile
syn keyword stCommand infix
syn keyword stCommand input
syn keyword stCommand insheet
syn keyword stCommand joinby
syn keyword stCommand la[bel]
syn keyword stCommand levelsof
syn keyword stCommand list
syn keyword stCommand loc[al]
syn keyword stCommand log
syn keyword stCommand ma[cro]
syn keyword stCommand mark
syn keyword stCommand markout
syn keyword stCommand marksample
syn keyword stCommand mata
syn keyword stCommand matrix
syn keyword stCommand memory
syn keyword stCommand merge
syn keyword stCommand mkdir
syn keyword stCommand more
syn keyword stCommand net
syn keyword stCommand nobreak
syn keyword stCommand n[oisily]
syn keyword stCommand note[s]
syn keyword stCommand numlist
syn keyword stCommand outfile
syn keyword stCommand outsheet
syn keyword stCommand _parse
syn keyword stCommand pause
syn keyword stCommand plugin
syn keyword stCommand post
syn keyword stCommand postclose
syn keyword stCommand postfile
syn keyword stCommand preserve
syn keyword stCommand print
syn keyword stCommand printer
syn keyword stCommand profiler
syn keyword stCommand pr[ogram]
syn keyword stCommand q[uery]
syn keyword stCommand qui[etly]
syn keyword stCommand rcof
syn keyword stCommand reg[ress]
syn keyword stCommand rename
syn keyword stCommand repeat
syn keyword stCommand replace
syn keyword stCommand reshape
syn keyword stCommand ret[urn]
syn keyword stCommand _rmcoll
syn keyword stCommand _rmcoll
syn keyword stCommand _rmcollright
syn keyword stCommand rmdir
syn keyword stCommand _robust
syn keyword stCommand save
syn keyword stCommand sca[lar]
syn keyword stCommand search
syn keyword stCommand serset
syn keyword stCommand set
syn keyword stCommand shell
syn keyword stCommand sleep
syn keyword stCommand sort
syn keyword stCommand split
syn keyword stCommand sret[urn]
syn keyword stCommand ssc
syn keyword stCommand su[mmarize]
syn keyword stCommand syntax
syn keyword stCommand sysdescribe
syn keyword stCommand sysdir
syn keyword stCommand sysuse
syn keyword stCommand token[ize]
syn keyword stCommand translate
syn keyword stCommand type
syn keyword stCommand unab
syn keyword stCommand unabcmd
syn keyword stCommand update
syn keyword stCommand use
syn keyword stCommand vers[ion]
syn keyword stCommand view
syn keyword stCommand viewsource
syn keyword stCommand webdescribe
syn keyword stCommand webseek
syn keyword stCommand webuse
syn keyword stCommand which
syn keyword stCommand who
syn keyword stCommand window

" Literals
syn match  stQuote   /"/
syn region stEString matchgroup=Nothing start=/`"/ end=/"'/ oneline contains=@stMacroGroup,stQuote,stString,stEString
syn region stString  matchgroup=Nothing start=/"/ end=/"/   oneline contains=@stMacroGroup

" define clusters
syn cluster stFuncGroup contains=@stMacroGroup,stFunc,stString,stEstring
syn cluster stMacroGroup contains=stGlobal,stLocal
syn cluster stParenGroup contains=stParenError,stBracketError,stBraceError,stSpecial,stFormat

" Stata functions
" Math
syn region stFunc matchgroup=Function start=/abs(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/acos(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/asin(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/atan(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/atan2(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/atanh(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/ceil(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/cloglog(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/comb(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/cos(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/digamma(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/exp(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/floor(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/int(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invcloglog(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invlogit(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/ln(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/lnfact(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/lnfactorial(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/lngamma(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/log(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/log10(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/logit(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/max(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/mod(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/reldif(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/round(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/sign(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/sin(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/sqrt(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/sum(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/tan(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/tanh(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/trigamma(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/trunc(/ end=/)/ contains=@stFuncGroup
" Probability distriubtions and density functions
syn region stFunc matchgroup=Function start=/betaden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/Binomial(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/binorm(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/binormal(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/chi2(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/chi2tail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dgammapda(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dgammapdada(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dgammapdadx(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dgammapdx(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dgammapdxdx(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/F(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/Fden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/Ftail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/gammaden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/gammap(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/ibeta(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invbinomial(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invchi2(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invchi2tail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invF(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invFtail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invgammap(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invibeta(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invnchi2(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invFtail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invibeta(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invnorm(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invnormal(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invttail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/lnnormal(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/lnnormalden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/nbetaden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/nchi2(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/nFden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/nFtail(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/nibeta(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/norm(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/normal(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/normalden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/normden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/npnchi2(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/tden(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/ttail(/ end=/)/ contains=@stFuncGroup
" Random numbers
syn region stFunc matchgroup=Function start=/uniform(/ end=/)/ contains=@stFuncGroup
" String
syn region stFunc matchgroup=Function start=/abbrev(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/hchar(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/indexnot(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/itrim(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/length(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/lower(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/ltrim(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/plural(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/proper(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/real(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/regexm(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/regexr(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/regexs(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/reverse(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/rtrim(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/string(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/strlen(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/strmatch(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/strpos(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/subinstr(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/subinword(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/substr(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/trim(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/upper(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/word(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/wordcount(/ end=/)/ contains=@stFuncGroup
" Programming
syn region stFunc matchgroup=Function start=/autocode(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/byteorder(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/c(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/_caller(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/chop(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/clip(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/cond(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/e(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/epsdouble(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/epsfloat(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/float(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/has_eprop(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/has_eprop(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/inlist(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/inrange(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/irecode(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/matrix(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/maxbyte(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/maxdouble(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/maxfloat(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/maxint(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/maxlong(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/mi(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/minbyte(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/mindouble(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/minfloat(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/minint(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/minlong(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/missing(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/r(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/recode(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/replay(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/return(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/s(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/scalar(/ end=/)/ contains=@stFuncGroup
" Date
syn region stFunc matchgroup=Function start=/d(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/date(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/day(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dow(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/doy(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/halfyear(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/mdy(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/month(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/quarter(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/week(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/year(/ end=/)/ contains=@stFuncGroup
" Time-series
syn region stFunc matchgroup=Function start=/daily(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/halfyearly(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/monthly(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/quarterly(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/weekly(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/yearly(/ end=/)/ contains=@stFuncGroup
"
syn region stFunc matchgroup=Function start=/yh(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/ym(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/yq(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/yw(/ end=/)/ contains=@stFuncGroup
"
syn region stFunc matchgroup=Function start=/d(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/h(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/m(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/q(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/w(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/y(/ end=/)/ contains=@stFuncGroup
"
syn region stFunc matchgroup=Function start=/dofd(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dofh(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dofm(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dofq(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dofw(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/dofy(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/hofd(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/mofd(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/qofd(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/wofd(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/yofd(/ end=/)/ contains=@stFuncGroup
"
syn region stFunc matchgroup=Function start=/tin(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/twithin(/ end=/)/ contains=@stFuncGroup
" Matrix
syn region stFunc matchgroup=Function start=/colnumb(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/colsof(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/det(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/diag0cnt(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/el(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/issymmetric(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/matmissing(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/mreldif(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/rownumb(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/rowsof(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/trace(/ end=/)/ contains=@stFuncGroup
"
syn region stFunc matchgroup=Function start=/cholsky(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/corr(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/diag(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/get(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/hadamard(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/I(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/inv(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/invsym(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/J(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/matuniform(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/nullmat(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/sweep(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/vec(/ end=/)/ contains=@stFuncGroup
syn region stFunc matchgroup=Function start=/vecdiag(/ end=/)/ contains=@stFuncGroup

" Errors to catch
" taken from $VIMRUNTIME/syntax/c.vim 
" catch errors caused by wrong parenthesis, braces and brackets
syn region	stParen		transparent start=/(/ end=/)/  contains=ALLBUT,@stParenGroup,stErrInBracket,stErrInBrace
syn region	stBracket	transparent start=/\[/ end=/]/ contains=ALLBUT,@stParenGroup,stErrInParen,stErrInBrace
syn region	stBrace		transparent start=/{/ end=/}/  contains=ALLBUT,@stParenGroup,stErrInParen,stErrInBracket
syn match	stParenError	/[\])}]/
syn match	stBracketError	/]/
syn match	stBraceError	/}/
syn match	stErrInParen	contained /[\]{}]/
syn match	stErrInBracket	contained /[){}]/
syn match	stErrInBrace	contained /[)\]]/

" assign highlight groups
hi link stBraceError		stError
hi link stBracketError		stError
hi link stErrInBrace		stError
hi link stErrInBracket		stError
hi link stErrInParen		stError
hi link stEString		stString
hi link stFormat		stSpecial
hi link stGlobal		stMacro
hi link stLocal			stMacro
hi link stParenError		stError
hi link stSlashComment		stComment
hi link stStarComment		stComment

hi link stCommand		Define
hi link stComment		Comment
hi link stConditional		Conditional
hi link stError			Error
hi link stFunc			None
hi link stMacro			Define
hi link stRepeat		Repeat
hi link stSpecial		SpecialChar
hi link stString		String

let b:current_syntax = "stata"

" vim: ts=8
