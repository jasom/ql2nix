
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-png, 
   lisp_png,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_png  ];
      inherit stdenv;
      systemName = "png-test";
      
      sourceProject = "${lisp-project_cl-png}";
      patches = [];
      lisp_dependencies = "${lisp_png}";
      name = "lisp_png-test-0.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
