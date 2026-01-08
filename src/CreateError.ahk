; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Creates random error code
;
; 16-04-2012:
;    Relocated to seperate file

createError(arg) {
    FoundTemp := RegExMatch(arg, "^-") 
    if ( FoundTemp = 1 )  {
      ; temp code
      Random, RandomNumber, 1, 3
      if ( RandomNumber = 1 ) {
        StringReplace, NewStr, arg, -, ,
      } else if ( RandomNumber = 2 ) {
        StringReplace, NewStr, arg, 0, 9,
      } else if ( RandomNumber = 3 ) {
        StringReplace, NewStr, arg, -, _,
      }
    } else {
      ; normal code
      Random, RandomNumber, 1, 5
      if ( RandomNumber = 1 ) {
        StringReplace, NewStr, arg, a, s,""
      } else if ( RandomNumber = 2 ) {
        StringReplace, NewStr, arg, o, 0,""
      } else if ( RandomNumber = 3 ) {
        StringReplace, NewStr, arg, e, r,""
      } else if ( RandomNumber = 4 ) {
        StringReplace, NewStr, arg, i, 1,""
      } else if ( RandomNumber = 5 ) {
        StringReplace, NewStr, arg, t, r,""
      }
   }
   return NewStr
}