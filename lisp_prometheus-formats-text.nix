
{ buildLispPackage, stdenv, fetchurl, lisp-project_prometheus-cl, 
   lisp_alexandria, lisp_prometheus,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_prometheus  ];
      inherit stdenv;
      systemName = "prometheus.formats.text";
      
      sourceProject = "${lisp-project_prometheus-cl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_prometheus}";
      name = "lisp_prometheus-formats-text-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
