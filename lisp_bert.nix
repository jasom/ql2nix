
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bert, 
   lisp_erlang-term,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_erlang-term  ];
      inherit stdenv;
      systemName = "bert";
      
      sourceProject = "${lisp-project_cl-bert}";
      patches = [];
      lisp_dependencies = "${lisp_erlang-term}";
      name = "lisp_bert-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
