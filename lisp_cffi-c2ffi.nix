
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
   lisp_babel, lisp_trivial-features, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_trivial-features lisp_alexandria  ];
      inherit stdenv;
      systemName = "cffi/c2ffi";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_trivial-features} ${lisp_alexandria}";
      name = "lisp_cffi-c2ffi_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
