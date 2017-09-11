
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_geneva, lisp_geneva-mk2, lisp_named-readtables, lisp_split-sequence, lisp_trivial-documentation,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_geneva lisp_geneva-mk2 lisp_named-readtables lisp_split-sequence lisp_trivial-documentation  ];
      inherit stdenv;
      systemName = "geneva-cl";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_geneva} ${lisp_geneva-mk2} ${lisp_named-readtables} ${lisp_split-sequence} ${lisp_trivial-documentation}";
      name = "lisp_geneva-cl-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
