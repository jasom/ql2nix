
{ buildLispPackage, stdenv, fetchurl, lisp-project_dirt, 
   lisp_cl-soil, lisp_cepl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-soil lisp_cepl  ];
      inherit stdenv;
      systemName = "dirt";
      
      sourceProject = "${lisp-project_dirt}";
      patches = [];
      lisp_dependencies = "${lisp_cl-soil} ${lisp_cepl}";
      name = "lisp_dirt-release-quicklisp-1dd9d89e-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
