
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_geneva, lisp_maxpc, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_geneva lisp_maxpc lisp_split-sequence  ];
      inherit stdenv;
      systemName = "geneva-mk2";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_geneva} ${lisp_maxpc} ${lisp_split-sequence}";
      name = "lisp_geneva-mk2-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
