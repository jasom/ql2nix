
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamcrest, 
   lisp_cl-reexport, lisp_cl-ppcre, lisp_split-sequence, lisp_alexandria, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-reexport lisp_cl-ppcre lisp_split-sequence lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "hamcrest";
      
      sourceProject = "${lisp-project_cl-hamcrest}";
      patches = [];
      lisp_dependencies = "${lisp_cl-reexport} ${lisp_cl-ppcre} ${lisp_split-sequence} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_hamcrest-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
