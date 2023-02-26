%{
    #include <stdio.h>
    #include "y.tab.h"
%}


%%

0|[1-9][0-9]*\.[0-9]*[1-9]      { yylval.fval = atof(yytext); return FLOAT; }
0|[1-9][0-9]*                   { yylval.ival = atoi(yytext); return INT; }
\/                              return DIV;
\*                              return MUL;
\%                              return MOD;
\(                              return LPAR;
\)                              return RPAR;
\+                              return PLUS;
\-                              return MIN;
\n                              return EOL;
[\t ]
.

