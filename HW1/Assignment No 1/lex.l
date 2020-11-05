%{ 
	extern int yylex(); 
%} 
%option noyywrap

%%

"<html>" {printf("opening HTML tag \n");}
"</html>" {printf("closing HTML tag \n");}
"<head>" {printf("opening HEAD tag \n");}
"</head>" {printf("closing HEAD tag \n");}
"<body>" {printf("opening BODY tag \n");}
"</body>" {printf("closing BODY tag \n");}
"<h"[1-6]+[^>]*> {printf("opening HEADER tag \n");}
"</h"[1-6]+[^>]*> {printf("closing HEADER tag \n");}
"<p"[^>]*> {printf("opening PARAGRAPH tag \n");}
"<br>" {printf("NEWLINE tag \n");}
"</p>" {printf("closing PARAGRAPH tag \n");}
"<a"[^>]*> {printf("opening ANCHOR tag \n");}
"</a>" {printf("closing ANCHOR tag \n");}
"<tt>" {printf("opening TELETYPE tag \n");}
"</tt>" {printf("closing TELETYPE tag \n");}
[^<]* {printf("text\n");}
.    {printf("Invalid\n");exit(1);}


%%

int main(int argc, char** argv) { 
	while (yylex()); 
}
