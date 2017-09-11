
{ buildLispPackage, stdenv, fetchurl, lisp-project_group-by, 
   lisp_alexandria, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "group-by";
      
      sourceProject = "${lisp-project_group-by}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_group-by-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
