%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%%

0|[1-9][0-9]*   {yylval=atoi(yytext); return NUMBER;}

UP     return TOKUP;
DOWN   return TOKDOWN;
RIGHT	return TOKRIGHT;	
LEFT	return TOKLEFT;
exit    {exit(1);};
\n	

[ \t]+	
%%
