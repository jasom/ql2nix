
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gearman, 
   lisp_alexandria, lisp_babel, lisp_split-sequence, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_split-sequence lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-gearman";
      
      sourceProject = "${lisp-project_cl-gearman}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_split-sequence} ${lisp_usocket}";
      name = "lisp_cl-gearman-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
