
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_trivial-documentation, lisp_maxpc, lisp_split-sequence, lisp_named-readtables,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-documentation lisp_maxpc lisp_split-sequence lisp_named-readtables  ];
      inherit stdenv;
      systemName = "geneva-cl";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-documentation} ${lisp_maxpc} ${lisp_split-sequence} ${lisp_named-readtables}";
      name = "lisp_geneva-cl-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
