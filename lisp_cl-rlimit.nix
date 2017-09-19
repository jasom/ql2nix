
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rlimit, 
   lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-rlimit";
      
      sourceProject = "${lisp-project_cl-rlimit}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel}";
      name = "lisp_cl-rlimit-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
