
{ buildLispPackage, stdenv, fetchurl, lisp-project_basic-binary-ipc, 
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
      systemName = "basic-binary-ipc";
      
      sourceProject = "${lisp-project_basic-binary-ipc}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel}";
      name = "lisp_basic-binary-ipc-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
