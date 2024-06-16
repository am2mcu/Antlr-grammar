grammar FinalGrammarAddKeyword;

program:
     importStatement+ statement*
    ;
    // Q0 -> starts with at least one import statement them other statements

statement:
    block
    | emptyStatement
    | variableStatement
    | ifStatement
    | loopStatement
    | breakStatement
    | continueStatement
    | switchStatement
    | classStatement
    | functionStatement
    | returnStatement
    | exceptionStatement
    ;
    // commands & blocks (keywords)

block:
    OpenCurlyBracket
    statementState?
    CloseCurlyBracket
    ;
    // block of code

emptyStatement:
    ';'
    ;
    // function f();

statementState:
    statement+
    ;

importStatement:
    DollarSign Import ((identifierList | Star) (As Identifier)? From)? (String) ';'
    ;

variableStatement:
    (DollarSign (Var | Let | Const))? expressionList ';'
    ;

loopStatement:
    For OpenParenthesis declaration? ';' assignmentExpression? ';' assignmentExpression? CloseParenthesis statement
    | For Identifier In Identifier statement
    | For Identifier Of Identifier statement
    | While OpenParenthesis assignmentExpression CloseParenthesis statement
    | Do block While OpenParenthesis assignmentExpression CloseParenthesis ';'
    ;

breakStatement:
    Break ';'
    ;

continueStatement:
    Continue ';'
    ;

ifStatement:
    If OpenParenthesis assignmentExpression CloseParenthesis statement (Else statement)?
    ;

switchStatement:
    (Switch | Match) assignmentExpression OpenCurlyBracket
    (Case assignmentExpression Colon statementState?)*
    (Default Colon statementState?)?
    CloseCurlyBracket
    ;

classStatement:
    Class Identifier OpenCurlyBracket
    statement*
    Constructor OpenParenthesis declaration? CloseParenthesis block
    statement*
    CloseCurlyBracket
    ;

returnStatement:
    Return (assignmentExpression | functionStatement)? ';'
    ;

functionStatement:
    Function Identifier OpenParenthesis declaration? CloseParenthesis statement
    | (DollarSign (Var | Let | Const))? Identifier '=' OpenParenthesis declaration? CloseParenthesis Arrow expressionList ';' // arrow function
//    | OpenParenthesis declaration? CloseParenthesis Arrow expressionList
    ;

exceptionStatement:
    Try block (Catch OpenParenthesis declaration? CloseParenthesis block)+ (Finally block)?
    ;

declaration:
    initializeList (',' initializeList)*
    ;
    // dataType1 exp1, exp2, ..., dataType2 exp3, exp4, ...

type:
    ( Char
    | StringType
    | Short
    | Int
    | Long
    | FloatType
    | Double
    | Signed
    | Unsigned
    | Boolean
    | Var
    | Let
    | Const)
    | Identifier // new objects
    ;
    // data type

initializeList:
    type? initialize (',' initialize)*
    ;
    // dataType var1 = val1, var2, ...

initialize:
    declarator ('=' expressionList)?
    ;
    // var = exp (value)

expressionList:
    type? assignmentExpression (',' assignmentExpression)*
    ;

assignmentExpression:
    conditionalExp
//    | unaryExp assignmentOperator assignmentExpression
    | declarator (assignmentOperator assignmentExpression)? // TODO: assignable
    ;

assignmentOperator:
    '='
    | '=>'
    | '*='
    | '/='
    | '%='
    | '+='
    | '-='
    | '<<='
    | '>>='
    | '>>>='
    | '&='
    | '^='
    | '|='
    | '**='
    ;

conditionalExp:
    logicalExp ('?' expressionList ':' conditionalExp)?
    ;

logicalExp:
    compareExp (('||' | '&&') compareExp)*
    ;

compareExp:
    equalityExp (('<' | '>' | '<=' | '>=') equalityExp)*
    ;

equalityExp:
    bitwiseExp (('===' | '==' | '!=' | '<>') bitwiseExp)*
    ;

bitwiseExp:
    shiftExp (('&' | '^' | '|') shiftExp)*
    ;

shiftExp:
    addSubExp (('<<' | '>>') addSubExp)*
    ;

addSubExp:
    mulDivExp (('+' | '-') mulDivExp)*
    ;

mulDivExp:
    powerExp (('*' | '/' | '//' | '%') powerExp)*
    ;

powerExp:
    unaryExp (('**') unaryExp)*
    ;

unaryExp:
    (unaryExp2 ('++' | '--')?)
    ;

unaryExp2:
    (('++' | '--')? pstvNgtvExp)
    ;

pstvNgtvExp:
    ('+' | '-')? notExp
    ;

notExp:
    ('~' | '!')? postfix
    ;

postfix:
    ( This
    | Null
    | True
    | False
    | Identifier
    | Number
    | String
    | '(' expressionList ')'
    )
    ( '(' expressionList? ')' // function Call
    | ('.' | '->') Identifier // method
    | '[' expressionList ']' // array
    )*
    ;

declarator:
    identifierList
    | declarator '[' expressionList ']' // array
    | This (('.' | '->') Identifier)*
    ;

identifierList:
    Identifier (',' Identifier)*
    ;

// Fragment
fragment NonDigit: [a-zA-Z];
fragment Digit: [0-9];
fragment NonZeroDigit: [1-9];
fragment Exponent: [eE] [+-]? [0-9]+;
fragment SpecialChar: [_$];

// Keywords
Import: 'import';
From: 'from';
Star: '*';
As: 'as';
Let: 'let';
Var: 'var';
Const: 'const';
For: 'for';
In: 'in';
Of: 'of';
While: 'while';
Do: 'do';
Break: 'break';
Continue: 'continue';
If: 'if';
Else: 'else';
QuestionMark: '?';
Colon: ':';
Return: 'return';
Switch: 'switch';
Match: 'match';
Case: 'case';
Default: 'default';
Class: 'class';
Constructor: 'constructor';
This: 'this';
Function: 'function';
Char: 'char';
StringType: 'string';
Short: 'short';
Int: 'int';
Long: 'long';
FloatType: 'float';
Double: 'double';
Signed: 'signed';
Unsigned: 'unsigned';
Boolean: 'boolean';
Null: 'Null';
Arrow: '=>';
Try: 'try';
Catch: 'catch';
Finally: 'finally';
DollarSign: '$';
OpenCurlyBracket: '{';
CloseCurlyBracket: '}';
OpenParenthesis: '(';
CloseParenthesis: ')';
True: 'true';
False: 'false';

Identifier:
    NonDigit
    (NonDigit | Digit | SpecialChar)+
    ;
    // variable/function/class name

Number:
    Integer
    | Float
    ;

Integer:
    '0'+ | NonZeroDigit Digit*
    ;

Float:
    Digit* '.' Digit+
    | Digit? '.' Digit+ Exponent?
    ;

String:
    '"' ~[\\"\r\n]* '"'
    | '\'' ~[\\'\r\n]* '\''
    ;

WS: [ \t\r\n] -> skip;
SINGLE_LINE_COMMENT: '//' ~[\r\n]* -> skip;
MULTI_LINE_COMMENT: '/*' .*? '*/' -> skip; // .: any char