
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libevent2, 
  libevent,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libevent ];
      inherit stdenv;
      systemName = "cl-libevent2-ssl";
      
      sourceProject = "${lisp-project_cl-libevent2}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-libevent2-ssl-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
