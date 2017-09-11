
{ buildLispPackage, stdenv, fetchurl, lisp-project_hyperobject, 
   lisp_clsql, lisp_kmrcl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_kmrcl  ];
      inherit stdenv;
      systemName = "hyperobject";
      
      sourceProject = "${lisp-project_hyperobject}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_kmrcl}";
      name = "lisp_hyperobject-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
