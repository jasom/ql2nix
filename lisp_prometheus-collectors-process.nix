
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_split-sequence, lisp_quantile-estimator, lisp_local-time, lisp_cl-ppcre, lisp_bordeaux-threads, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_quantile-estimator lisp_local-time lisp_cl-ppcre lisp_bordeaux-threads lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "prometheus.collectors.process";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_quantile-estimator} ${lisp_local-time} ${lisp_cl-ppcre} ${lisp_bordeaux-threads} ${lisp_cffi-grovel}";
      name = "lisp_prometheus-collectors-process-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
