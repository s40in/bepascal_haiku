typedef union {
  char *string;
  syntaxelem_t *elt;
  arg_t *arg;
  int flag;
} YYSTYPE;
#define	IDENTIFIER	257
#define	CONSTANT	258
#define	STRING_LITERAL	259
#define	CHAR	260
#define	SHORT	261
#define	INT	262
#define	LONG	263
#define	SIGNED	264
#define	UNSIGNED	265
#define	FLOAT	266
#define	DOUBLE	267
#define	VOID	268
#define	NEW	269
#define	DELETE	270
#define	TEMPLATE	271
#define	THROW	272
#define	PTR_OP	273
#define	INC_OP	274
#define	DEC_OP	275
#define	LEFT_OP	276
#define	RIGHT_OP	277
#define	LE_OP	278
#define	GE_OP	279
#define	EQ_OP	280
#define	NE_OP	281
#define	AND_OP	282
#define	OR_OP	283
#define	MUL_ASSIGN	284
#define	DIV_ASSIGN	285
#define	MOD_ASSIGN	286
#define	ADD_ASSIGN	287
#define	SUB_ASSIGN	288
#define	LEFT_ASSIGN	289
#define	RIGHT_ASSIGN	290
#define	AND_ASSIGN	291
#define	XOR_ASSIGN	292
#define	OR_ASSIGN	293
#define	CLCL	294
#define	MEM_PTR_OP	295
#define	FRIEND	296
#define	OPERATOR	297
#define	CONST	298
#define	CLASS	299
#define	STRUCT	300
#define	UNION	301
#define	ENUM	302
#define	PROTECTED	303
#define	PRIVATE	304
#define	PUBLIC	305
#define	EXTERN	306
#define	ELIPSIS	307


extern YYSTYPE yylval;
