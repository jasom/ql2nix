
{ buildLispPackage, stdenv, fetchurl, lisp-project_lambdalite, 
   lisp_bordeaux-threads, lisp_wu-sugar,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_wu-sugar  ];
      inherit stdenv;
      systemName = "lambdalite";
      
      sourceProject = "${lisp-project_lambdalite}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_wu-sugar}";
      name = "lisp_lambdalite-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
