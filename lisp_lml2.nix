
{ buildLispPackage, stdenv, fetchurl, lisp-project_lml2, 
   lisp_kmrcl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_kmrcl  ];
      inherit stdenv;
      systemName = "lml2";
      
      sourceProject = "${lisp-project_lml2}";
      patches = [];
      lisp_dependencies = "${lisp_kmrcl}";
      name = "lisp_lml2-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
