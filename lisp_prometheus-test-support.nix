
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_prove, lisp_quantile-estimator, lisp_local-time, lisp_cl-ppcre, lisp_bordeaux-threads, lisp_alexandria, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_quantile-estimator lisp_local-time lisp_cl-ppcre lisp_bordeaux-threads lisp_alexandria lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "prometheus.test.support";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_quantile-estimator} ${lisp_local-time} ${lisp_cl-ppcre} ${lisp_bordeaux-threads} ${lisp_alexandria} ${lisp_prove-asdf}";
      name = "lisp_prometheus-test-support-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
