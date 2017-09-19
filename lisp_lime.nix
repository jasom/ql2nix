
{ buildLispPackage, stdenv, fetchurl, lisp-project_lime, 
   lisp_trivial-types, lisp_alexandria, lisp_swank-protocol,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-types lisp_alexandria lisp_swank-protocol  ];
      inherit stdenv;
      systemName = "lime";
      
      sourceProject = "${lisp-project_lime}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-types} ${lisp_alexandria} ${lisp_swank-protocol}";
      name = "lisp_lime-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
