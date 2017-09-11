
{ buildLispPackage, stdenv, fetchurl, lisp-project_quantile-estimator-cl, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "quantile-estimator";
      
      sourceProject = "${lisp-project_quantile-estimator-cl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_quantile-estimator-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
