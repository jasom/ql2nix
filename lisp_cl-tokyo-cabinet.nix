
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tokyo-cabinet, 
  tokyocabinet,   lisp_cffi, lisp_deoxybyte-systems,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_deoxybyte-systems tokyocabinet ];
      inherit stdenv;
      systemName = "cl-tokyo-cabinet";
      
      sourceProject = "${lisp-project_cl-tokyo-cabinet}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_deoxybyte-systems}";
      name = "lisp_cl-tokyo-cabinet-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
