
{ buildLispPackage, stdenv, fetchurl, lisp-project_quantile-estimator-cl, 
   lisp_log4cl, lisp_mw-equiv, lisp_prove, lisp_prove-asdf, lisp_quantile-estimator,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_log4cl lisp_mw-equiv lisp_prove lisp_prove-asdf lisp_quantile-estimator  ];
      inherit stdenv;
      systemName = "quantile-estimator.test";
      
      sourceProject = "${lisp-project_quantile-estimator-cl}";
      patches = [];
      lisp_dependencies = "${lisp_log4cl} ${lisp_mw-equiv} ${lisp_prove} ${lisp_prove-asdf} ${lisp_quantile-estimator}";
      name = "lisp_quantile-estimator-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
