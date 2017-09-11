
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_cl-postgres, lisp_cl-syntax, lisp_cl-syntax-annot, lisp_dbi, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-postgres lisp_cl-syntax lisp_cl-syntax-annot lisp_dbi lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "dbd-postgres";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-postgres} ${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_dbi} ${lisp_trivial-garbage}";
      name = "lisp_dbd-postgres-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
