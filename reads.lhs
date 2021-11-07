
https://stackoverflow.com/questions/8689560/in-what-scenarios-does-haskells-reads-return-more-than-one-list-item

None of the standard instances do so, but it's intended for ambiguous parses; since this is not really very useful, and parsers that use this functionality would be very inefficient, reads's return value is for all practical purposes a Maybe masquerading as a [].

The Report's definition of read reveals the intended meaning of multiple parses:

> read    :: (Read a) => String -> a  
> read s  =  case [x | (x,t) <- reads s, ("","") <- lex t] of  
>               [x] -> x  
>               []  -> error "PreludeText.read: no parse"  
>               _    -> error "PreludeText.read: ambiguous parse"
