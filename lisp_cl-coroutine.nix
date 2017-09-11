
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-coroutine, 
   lisp_alexandria, lisp_cl-cont,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-cont  ];
      inherit stdenv;
      systemName = "cl-coroutine";
      
      sourceProject = "${lisp-project_cl-coroutine}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-cont}";
      name = "lisp_cl-coroutine-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
