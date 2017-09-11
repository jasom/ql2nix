
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamcrest, 
   lisp_iterate, lisp_alexandria, lisp_split-sequence, lisp_cl-ppcre, lisp_cl-reexport,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_alexandria lisp_split-sequence lisp_cl-ppcre lisp_cl-reexport  ];
      inherit stdenv;
      systemName = "hamcrest";
      
      sourceProject = "${lisp-project_cl-hamcrest}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_alexandria} ${lisp_split-sequence} ${lisp_cl-ppcre} ${lisp_cl-reexport}";
      name = "lisp_hamcrest-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
