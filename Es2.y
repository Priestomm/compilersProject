%{
    #include <stdio.h>
    #include <string.h>

    void yyerror(const char *s);
    int yylex();
    int yywrap();
    
       
    typedef union {
        int ival;
        float fval;
        char *op;
    } nValue;
    
    
    struct node{
    	nValue val;
    	char type;
    	int un;
    	struct node *left;
    	struct node *right;
    };
	
	struct node *newNode(nValue value, char type);
    void printNode();

%}

%union {
    struct node *nod;
    int ival;
    float fval;
}

%token PLUS MIN DIV MUL MOD LPAR RPAR EOL
%token <ival> INT
%token <fval> FLOAT
%type <nod> e t f

%%

s: 
| s e EOL
{ 
	printNode($2, 0);
};
e: e PLUS t 
{ 
	struct node *newN = newNode((nValue) '+', 'c');
 	newN->left = $1;
 	newN->right = $3;
	$$ = newN;
}
| e MIN t
{ 
	struct node *newN = newNode((nValue) '-', 'c');
	newN->left = $1;
 	newN->right = $3;
	$$ = newN;
}
| t
{
	$$ = $1;
}

;

t: t MUL f 
{ 
	struct node *newN = newNode((nValue) '*', 'c');
	newN->left = $1;
 	newN->right = $3;
	$$ = newN;
}
| t DIV f
{ 
	struct node *newN = newNode((nValue) '/', 'c');
	newN->left = $1;
 	newN->right = $3;
	$$ = newN;
}
| t MOD f
{ 
	struct node *newN = newNode((nValue) '%', 'c');
	newN->left = $1;
 	newN->right = $3;
	$$ = newN;
}
| f
{ 
	$$ = $1;
}

f: INT
{ 
	struct node *newN = newNode((nValue) $1, 'i');
	newN->left = NULL;
 	newN->right = NULL;
	$$ = newN;
}
| FLOAT
{
	struct node *newN = newNode((nValue) $1, 'f');
	newN->left = NULL;
 	newN->right = NULL;
	$$ = newN;
}
| MIN f
{ 
	struct node *newN = newNode((nValue) '-', 'c');
	newN->left = $2;
	newN->un = 1;
	$$ = newN;
}
| PLUS f
{ 
	struct node *newN = newNode((nValue) '+', 'c');
	newN->left = $2;
	newN->un = 1;
	$$ = newN;
}
| LPAR e RPAR
{
	$$ = $2;
};

%%

    struct node *newNode(nValue value, char type) {
    	struct node *n = malloc(sizeof(struct node));
    	n->type = type;
    	n->val = value;
    
    	return n;
}

void printNode(struct node *n, int tab) {
    char *spaces = malloc(sizeof(char) * tab);
    for (int i = 0; i < tab; ++i) {
        spaces[i] = ' ';
    }
    switch (n->type) {
        case 'c':
        	if (n->un) 
        		printf("%s(%c)\n", spaces, n->val); 
        	else
        		printf("%s%c\n", spaces, n->val); 
        	break;
        case 'i': 
        	printf("%s%d\n", spaces, n->val); 
        	break;
        case 'f': 
        	printf("%s%f\n", spaces, n->val); 
        	break;
    }
    if (n->left != NULL)
        printNode(n->left, tab+2);
    if (n->right != NULL)
        printNode(n->right, tab+2);
}


int yywrap() {
    return -1;
}

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(char argc, char **argv) {
     yyparse();
}

