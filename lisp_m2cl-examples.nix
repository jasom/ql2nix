
{ buildLispPackage, stdenv, fetchurl, lisp-project_m2cl, 
   lisp_bordeaux-threads, lisp_m2cl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_m2cl  ];
      inherit stdenv;
      systemName = "m2cl-examples";
      
      sourceProject = "${lisp-project_m2cl}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_m2cl}";
      name = "lisp_m2cl-examples-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
