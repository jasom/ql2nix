
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-table, 
   lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-table";
      
      sourceProject = "${lisp-project_cl-table}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_cl-table-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
