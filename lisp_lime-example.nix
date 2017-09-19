
{ buildLispPackage, stdenv, fetchurl, lisp-project_lime, 
   lisp_bordeaux-threads, lisp_trivial-types, lisp_alexandria, lisp_swank-protocol,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_trivial-types lisp_alexandria lisp_swank-protocol  ];
      inherit stdenv;
      systemName = "lime-example";
      
      sourceProject = "${lisp-project_lime}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_trivial-types} ${lisp_alexandria} ${lisp_swank-protocol}";
      name = "lisp_lime-example-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
