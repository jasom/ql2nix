
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-iconv, 
   lisp_iolib, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib lisp_cffi  ];
      inherit stdenv;
      systemName = "iconv";
      
      sourceProject = "${lisp-project_cl-iconv}";
      patches = [];
      lisp_dependencies = "${lisp_iolib} ${lisp_cffi}";
      name = "lisp_iconv-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
