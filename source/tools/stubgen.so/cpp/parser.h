/* A Bison parser, made by GNU Bison 2.4.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
   2009, 2010 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFIER = 258,
     CONSTANT = 259,
     STRING_LITERAL = 260,
     CHAR = 261,
     SHORT = 262,
     INT = 263,
     LONG = 264,
     SIGNED = 265,
     UNSIGNED = 266,
     FLOAT = 267,
     DOUBLE = 268,
     VOID = 269,
     NEW = 270,
     DELETE = 271,
     TEMPLATE = 272,
     THROW = 273,
     PTR_OP = 274,
     INC_OP = 275,
     DEC_OP = 276,
     LEFT_OP = 277,
     RIGHT_OP = 278,
     LE_OP = 279,
     GE_OP = 280,
     EQ_OP = 281,
     NE_OP = 282,
     AND_OP = 283,
     OR_OP = 284,
     MUL_ASSIGN = 285,
     DIV_ASSIGN = 286,
     MOD_ASSIGN = 287,
     ADD_ASSIGN = 288,
     SUB_ASSIGN = 289,
     LEFT_ASSIGN = 290,
     RIGHT_ASSIGN = 291,
     AND_ASSIGN = 292,
     XOR_ASSIGN = 293,
     OR_ASSIGN = 294,
     CLCL = 295,
     MEM_PTR_OP = 296,
     FRIEND = 297,
     OPERATOR = 298,
     CONST = 299,
     CLASS = 300,
     STRUCT = 301,
     UNION = 302,
     ENUM = 303,
     PROTECTED = 304,
     PRIVATE = 305,
     PUBLIC = 306,
     EXTERN = 307,
     ELIPSIS = 308
   };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define CONSTANT 259
#define STRING_LITERAL 260
#define CHAR 261
#define SHORT 262
#define INT 263
#define LONG 264
#define SIGNED 265
#define UNSIGNED 266
#define FLOAT 267
#define DOUBLE 268
#define VOID 269
#define NEW 270
#define DELETE 271
#define TEMPLATE 272
#define THROW 273
#define PTR_OP 274
#define INC_OP 275
#define DEC_OP 276
#define LEFT_OP 277
#define RIGHT_OP 278
#define LE_OP 279
#define GE_OP 280
#define EQ_OP 281
#define NE_OP 282
#define AND_OP 283
#define OR_OP 284
#define MUL_ASSIGN 285
#define DIV_ASSIGN 286
#define MOD_ASSIGN 287
#define ADD_ASSIGN 288
#define SUB_ASSIGN 289
#define LEFT_ASSIGN 290
#define RIGHT_ASSIGN 291
#define AND_ASSIGN 292
#define XOR_ASSIGN 293
#define OR_ASSIGN 294
#define CLCL 295
#define MEM_PTR_OP 296
#define FRIEND 297
#define OPERATOR 298
#define CONST 299
#define CLASS 300
#define STRUCT 301
#define UNION 302
#define ENUM 303
#define PROTECTED 304
#define PRIVATE 305
#define PUBLIC 306
#define EXTERN 307
#define ELIPSIS 308




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1685 of yacc.c  */
#line 366 "source/tools/stubgen.so/cpp/parser.y"

  char *string;
  syntaxelem_t *elt;
  arg_t *arg;
  int flag;



/* Line 1685 of yacc.c  */
#line 166 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


