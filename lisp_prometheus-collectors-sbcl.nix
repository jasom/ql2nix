
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_prometheus,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prometheus  ];
      inherit stdenv;
      systemName = "prometheus.collectors.sbcl";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_prometheus}";
      name = "lisp_prometheus-collectors-sbcl-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
