
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-exe, 
   lisp_osicat,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat  ];
      inherit stdenv;
      systemName = "trivial-exe";
      
      sourceProject = "${lisp-project_trivial-exe}";
      patches = [];
      lisp_dependencies = "${lisp_osicat}";
      name = "lisp_trivial-exe-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
