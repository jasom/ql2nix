
{ buildLispPackage, stdenv, fetchurl, lisp-project_laap, 
   lisp_cl-base32, lisp_cl-ppcre, lisp_bordeaux-threads, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base32 lisp_cl-ppcre lisp_bordeaux-threads lisp_cffi  ];
      inherit stdenv;
      systemName = "laap";
      
      sourceProject = "${lisp-project_laap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base32} ${lisp_cl-ppcre} ${lisp_bordeaux-threads} ${lisp_cffi}";
      name = "lisp_laap-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
