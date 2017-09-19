
{ buildLispPackage, stdenv, fetchurl, lisp-project_escalator, 
   lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "escalator-bench";
      
      sourceProject = "${lisp-project_escalator}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_escalator-bench-20150608-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
