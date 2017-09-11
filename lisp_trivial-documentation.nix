
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-documentation, 
   lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "trivial-documentation";
      
      sourceProject = "${lisp-project_trivial-documentation}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_trivial-documentation-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
