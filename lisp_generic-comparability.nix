
{ buildLispPackage, stdenv, fetchurl, lisp-project_generic-comparability, 
   lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "generic-comparability";
      
      sourceProject = "${lisp-project_generic-comparability}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_generic-comparability-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
