
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
   lisp_alexandria, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi  ];
      inherit stdenv;
      systemName = "cffi/c2ffi";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi}";
      name = "lisp_cffi-c2ffi_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
