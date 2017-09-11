
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-slug, 
   lisp_cl-ppcre,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "cl-slug";
      
      sourceProject = "${lisp-project_cl-slug}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_cl-slug-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
