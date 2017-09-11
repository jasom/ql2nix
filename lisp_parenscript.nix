
{ buildLispPackage, stdenv, fetchurl, lisp-project_parenscript, 
   lisp_anaphora, lisp_cl-ppcre, lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-ppcre lisp_named-readtables  ];
      inherit stdenv;
      systemName = "parenscript";
      
      sourceProject = "${lisp-project_parenscript}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-ppcre} ${lisp_named-readtables}";
      name = "lisp_parenscript-2.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
