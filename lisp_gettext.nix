
{ buildLispPackage, stdenv, fetchurl, lisp-project_gettext, 
   lisp_split-sequence, lisp_yacc, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_yacc lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "gettext";
      
      sourceProject = "${lisp-project_gettext}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_yacc} ${lisp_flexi-streams}";
      name = "lisp_gettext-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
