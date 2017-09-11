
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_cffi, lisp_cffi-grovel, lisp_cl-fad, lisp_prometheus, lisp_split-sequence,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel lisp_cl-fad lisp_prometheus lisp_split-sequence  ];
      inherit stdenv;
      systemName = "prometheus.collectors.process";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel} ${lisp_cl-fad} ${lisp_prometheus} ${lisp_split-sequence}";
      name = "lisp_prometheus-collectors-process-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
