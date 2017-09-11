
{ buildLispPackage, stdenv, fetchurl, lisp-project_generators, 
   lisp_alexandria, lisp_cl-cont, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-cont lisp_iterate  ];
      inherit stdenv;
      systemName = "generators";
      
      sourceProject = "${lisp-project_generators}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-cont} ${lisp_iterate}";
      name = "lisp_generators-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
