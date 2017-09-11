
{ buildLispPackage, stdenv, fetchurl, lisp-project_hyperobject, 
   lisp_hyperobject, lisp_rt,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hyperobject lisp_rt  ];
      inherit stdenv;
      systemName = "hyperobject-tests";
      
      sourceProject = "${lisp-project_hyperobject}";
      patches = [];
      lisp_dependencies = "${lisp_hyperobject} ${lisp_rt}";
      name = "lisp_hyperobject-tests-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
