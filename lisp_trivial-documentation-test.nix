
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-documentation, 
   lisp_trivial-documentation,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-documentation  ];
      inherit stdenv;
      systemName = "trivial-documentation-test";
      
      sourceProject = "${lisp-project_trivial-documentation}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-documentation}";
      name = "lisp_trivial-documentation-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
