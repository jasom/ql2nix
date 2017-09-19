
{ buildLispPackage, stdenv, fetchurl, lisp-project_djula, 
   lisp_parser-combinators, lisp_gettext, lisp_cl-locale, lisp_cl-slice, lisp_trivial-backtrace, lisp_local-time, lisp_split-sequence, lisp_cl-fad, lisp_babel, lisp_access,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parser-combinators lisp_gettext lisp_cl-locale lisp_cl-slice lisp_trivial-backtrace lisp_local-time lisp_split-sequence lisp_cl-fad lisp_babel lisp_access  ];
      inherit stdenv;
      systemName = "djula";
      
      sourceProject = "${lisp-project_djula}";
      patches = [];
      lisp_dependencies = "${lisp_parser-combinators} ${lisp_gettext} ${lisp_cl-locale} ${lisp_cl-slice} ${lisp_trivial-backtrace} ${lisp_local-time} ${lisp_split-sequence} ${lisp_cl-fad} ${lisp_babel} ${lisp_access}";
      name = "lisp_djula-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
