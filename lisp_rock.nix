
{ buildLispPackage, stdenv, fetchurl, lisp-project_rock, 
   lisp_anaphora, lisp_trivial-types, lisp_trivial-extract, lisp_trivial-download,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_trivial-types lisp_trivial-extract lisp_trivial-download  ];
      inherit stdenv;
      systemName = "rock";
      
      sourceProject = "${lisp-project_rock}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_trivial-types} ${lisp_trivial-extract} ${lisp_trivial-download}";
      name = "lisp_rock-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
