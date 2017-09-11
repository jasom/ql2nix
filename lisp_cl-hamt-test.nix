
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamt, 
   lisp_cl-hamt, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-hamt lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-hamt-test";
      
      sourceProject = "${lisp-project_cl-hamt}";
      patches = [];
      lisp_dependencies = "${lisp_cl-hamt} ${lisp_fiveam}";
      name = "lisp_cl-hamt-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
