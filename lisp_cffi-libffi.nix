
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
  libffi,   lisp_babel, lisp_trivial-features, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_trivial-features lisp_alexandria libffi ];
      inherit stdenv;
      systemName = "cffi-libffi";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_trivial-features} ${lisp_alexandria}";
      name = "lisp_cffi-libffi_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
