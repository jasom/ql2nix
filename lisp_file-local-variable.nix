
{ buildLispPackage, stdenv, fetchurl, lisp-project_file-local-variable, 
   lisp_trivia, lisp_alexandria, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivia lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "file-local-variable";
      
      sourceProject = "${lisp-project_file-local-variable}";
      patches = [];
      lisp_dependencies = "${lisp_trivia} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_file-local-variable-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
