
{ buildLispPackage, stdenv, fetchurl, lisp-project_basic-binary-ipc, 
   lisp_basic-binary-ipc, lisp_bordeaux-threads, lisp_lisp-unit,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_basic-binary-ipc lisp_bordeaux-threads lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "basic-binary-ipc-tests";
      
      sourceProject = "${lisp-project_basic-binary-ipc}";
      patches = [];
      lisp_dependencies = "${lisp_basic-binary-ipc} ${lisp_bordeaux-threads} ${lisp_lisp-unit}";
      name = "lisp_basic-binary-ipc-tests-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
