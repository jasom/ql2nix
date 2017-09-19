
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_cl-coveralls, lisp_cffi-grovel, lisp_salza2, lisp_trivial-utf-8, lisp_hunchentoot, lisp_drakma, lisp_cl-interpol, lisp_mw-equiv, lisp_log4cl, lisp_prove, lisp_quantile-estimator, lisp_local-time, lisp_cl-ppcre, lisp_bordeaux-threads, lisp_alexandria, lisp_prove-asdf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-coveralls lisp_cffi-grovel lisp_salza2 lisp_trivial-utf-8 lisp_hunchentoot lisp_drakma lisp_cl-interpol lisp_mw-equiv lisp_log4cl lisp_prove lisp_quantile-estimator lisp_local-time lisp_cl-ppcre lisp_bordeaux-threads lisp_alexandria lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "prometheus.test.all";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-coveralls} ${lisp_cffi-grovel} ${lisp_salza2} ${lisp_trivial-utf-8} ${lisp_hunchentoot} ${lisp_drakma} ${lisp_cl-interpol} ${lisp_mw-equiv} ${lisp_log4cl} ${lisp_prove} ${lisp_quantile-estimator} ${lisp_local-time} ${lisp_cl-ppcre} ${lisp_bordeaux-threads} ${lisp_alexandria} ${lisp_prove-asdf}";
      name = "lisp_prometheus-test-all-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
