[
  "(" ")"
] @bracket

[
  ":="
  "+="
  "?="
] @operator

[
  "subst"
  "patsubst"
  "strip"
  "findstring"
  "filter"
  "filter-out"
  "sort"
  "word"
  "words"
  "wordlist"
  "firstword"
  "lastword"
  "dir"
  "notdir"
  "suffix"
  "basename"
  "addsuffix"
  "addprefix"
  "join"
  "wildcard"
  "realpath"
  "abspath"
  "error"
  "warning"
  "info"
  "origin"
  "flavor"
  "foreach"
  "if"
  "or"
  "and"
  "call"
  "eval"
  "file"
  "value"
] @identifier.function

"shell" @identifier.function

[
  "ifeq"
  "ifneq"
  "else"
  "endif"
] @keyword.condition

[ 
  "override"
] @keyword.modifier

[
  "VPATH"
  ".RECIPEPREFIX"
] @identifier.core

[
  (variable_reference)
  (automatic_variable)
  (substitution_reference)
] @identifier.variable

(string) @string
(text) @string

(comment) @comment

(variable_assignment
  name: (word) @identifier.variable)


(targets) @processing.directive
(rule
  target: (_) @string-template) 

(recipe_line
  ["@" "-" "+"] @keyword.modifier) 
  
(prerequisites) @processing.argument
