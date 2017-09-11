
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-ppcre, lisp_local-time, lisp_quantile-estimator,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-ppcre lisp_local-time lisp_quantile-estimator  ];
      inherit stdenv;
      systemName = "prometheus";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-ppcre} ${lisp_local-time} ${lisp_quantile-estimator}";
      name = "lisp_prometheus-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
