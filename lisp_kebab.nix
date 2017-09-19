
{ buildLispPackage, stdenv, fetchurl, lisp-project_kebab, 
   lisp_split-sequence, lisp_alexandria, lisp_cl-interpol, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_alexandria lisp_cl-interpol lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "kebab";
      
      sourceProject = "${lisp-project_kebab}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_alexandria} ${lisp_cl-interpol} ${lisp_cl-ppcre}";
      name = "lisp_kebab-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
