
{ buildLispPackage, stdenv, fetchurl, lisp-project_patron, 
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
      systemName = "patron";
      
      sourceProject = "${lisp-project_patron}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads}";
      name = "lisp_patron-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
