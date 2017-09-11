
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-hooks, 
   lisp_alexandria, lisp_closer-mop, lisp_let-plus, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop lisp_let-plus lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-hooks";
      
      sourceProject = "${lisp-project_architecture-hooks}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop} ${lisp_let-plus} ${lisp_trivial-garbage}";
      name = "lisp_cl-hooks-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
