
{ buildLispPackage, stdenv, fetchurl, lisp-project_vas-string-metrics, 
   lisp_vas-string-metrics,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vas-string-metrics  ];
      inherit stdenv;
      systemName = "test.vas-string-metrics";
      
      sourceProject = "${lisp-project_vas-string-metrics}";
      patches = [];
      lisp_dependencies = "${lisp_vas-string-metrics}";
      name = "lisp_test-vas-string-metrics-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
