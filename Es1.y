
%{
#include <stdio.h>
#include <string.h>

  int yylex();
  int yyparse();
  int pos_x, pos_y, fin_x, fin_y;

  void yyerror(const char *str){
    fprintf(stderr,"error %s\n",str);
  }
  int yywrap(){
    return 1;}
  int main(){
  	
  	printf("Your initial position is: ");
  	scanf("%d %d", &pos_x, &pos_y);
  	printf("Your destination is: ");
  	scanf("%d %d", &fin_x, &fin_y);
    yyparse();
	}
  %}
%token TOKUP TOKDOWN TOKRIGHT TOKLEFT NUMBER

%%
moves:

|moves move
;

move:
   go_up | go_down | go_left | go_right
   ;
go_up:
TOKUP NUMBER
{ pos_y = pos_y + $2;
  printf("Your position is now: (%d,%d)\n", pos_x, pos_y); 
  if (pos_x == fin_x && pos_y == fin_y) {
    	printf("You reached your destination\n");
    } else {
    	printf("You didn't reach your destination\n");
    }
  }
go_down:
TOKDOWN NUMBER
{ pos_y = pos_y - $2;
	printf("Your position is now: (%d,%d)\n", pos_x, pos_y);
	if (pos_x == fin_x && pos_y == fin_y) {
    	printf("You reached your destination\n");
    } else {
    	printf("You didn't reach your destination\n");
    }
  }
go_left:
TOKLEFT NUMBER
{ pos_x = pos_x - $2; 
	printf("Your position is now: (%d,%d)\n", pos_x, pos_y);
	if (pos_x == fin_x && pos_y == fin_y) {
    	printf("You reached your destination\n");
    } else {
    	printf("You didn't reach your destination\n");
    }
  }
go_right:
TOKRIGHT NUMBER
{ pos_x = pos_x + $2;
	printf("Your position is now: (%d,%d)\n", pos_x, pos_y);
	if (pos_x == fin_x && pos_y == fin_y) {
    	printf("You reached your destination\n");
    } else {
    	printf("You didn't reach your destination\n");
    }
  }


