
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libsvm, 
  libsvm,   lisp_cffi, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_trivial-garbage libsvm ];
      inherit stdenv;
      systemName = "cl-libsvm";
      
      sourceProject = "${lisp-project_cl-libsvm}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_trivial-garbage}";
      name = "lisp_cl-libsvm-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
