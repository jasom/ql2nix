
{ buildLispPackage, stdenv, fetchurl, lisp-project_dirt, 
   lisp_cepl, lisp_cl-soil,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_cl-soil  ];
      inherit stdenv;
      systemName = "dirt";
      
      sourceProject = "${lisp-project_dirt}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_cl-soil}";
      name = "lisp_dirt-release-quicklisp-b0f63553-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
