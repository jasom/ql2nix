
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tasukete, 
   lisp_cl-gists, lisp_dissect,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gists lisp_dissect  ];
      inherit stdenv;
      systemName = "cl-tasukete";
      
      sourceProject = "${lisp-project_cl-tasukete}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gists} ${lisp_dissect}";
      name = "lisp_cl-tasukete-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
