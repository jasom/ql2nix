
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libsvm, 
  libsvm,   lisp_trivial-garbage, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi libsvm ];
      inherit stdenv;
      systemName = "cl-libsvm";
      
      sourceProject = "${lisp-project_cl-libsvm}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_cl-libsvm-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
