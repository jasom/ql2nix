
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_hunchentoot, lisp_prometheus, lisp_prometheus-formats-text, lisp_salza2, lisp_trivial-utf-8,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_prometheus lisp_prometheus-formats-text lisp_salza2 lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "prometheus.exposers.hunchentoot";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_prometheus} ${lisp_prometheus-formats-text} ${lisp_salza2} ${lisp_trivial-utf-8}";
      name = "lisp_prometheus-exposers-hunchentoot-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
