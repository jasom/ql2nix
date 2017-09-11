
{ buildLispPackage, stdenv, fetchurl, lisp-project_clump, 
   lisp_clump,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clump  ];
      inherit stdenv;
      systemName = "clump-test";
      
      sourceProject = "${lisp-project_clump}";
      patches = [];
      lisp_dependencies = "${lisp_clump}";
      name = "lisp_clump-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
