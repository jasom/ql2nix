
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-graphviz, 
  graphviz,   lisp_metabang-bind, lisp_cffi, lisp_hu-dwim-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metabang-bind lisp_cffi lisp_hu-dwim-asdf graphviz ];
      inherit stdenv;
      systemName = "hu.dwim.graphviz";
      
      sourceProject = "${lisp-project_hu-dwim-graphviz}";
      patches = [];
      lisp_dependencies = "${lisp_metabang-bind} ${lisp_cffi} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-graphviz-20170830-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
