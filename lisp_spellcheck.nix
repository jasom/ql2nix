
{ buildLispPackage, stdenv, fetchurl, lisp-project_spellcheck, 
   lisp_cl-ppcre, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "spellcheck";
      
      sourceProject = "${lisp-project_spellcheck}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_spellcheck-20131003-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
