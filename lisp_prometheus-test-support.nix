
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_alexandria, lisp_prometheus, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_prometheus lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "prometheus.test.support";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_prometheus} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_prometheus-test-support-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
