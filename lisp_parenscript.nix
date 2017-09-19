
{ buildLispPackage, stdenv, fetchurl, lisp-project_parenscript, 
   lisp_named-readtables, lisp_anaphora, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_anaphora lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "parenscript";
      
      sourceProject = "${lisp-project_parenscript}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_anaphora} ${lisp_cl-ppcre}";
      name = "lisp_parenscript-2.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
