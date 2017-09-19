
{ buildLispPackage, stdenv, fetchurl, lisp-project_bit-ops, 
   lisp_immutable-struct, lisp_trivia, lisp_alexandria, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_immutable-struct lisp_trivia lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "bit-ops";
      
      sourceProject = "${lisp-project_bit-ops}";
      patches = [];
      lisp_dependencies = "${lisp_immutable-struct} ${lisp_trivia} ${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_bit-ops-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
