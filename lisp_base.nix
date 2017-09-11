
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_bordeaux-threads,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "base";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads}";
      name = "lisp_base-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
