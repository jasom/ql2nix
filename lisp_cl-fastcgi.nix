
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fastcgi, 
  fcgi,   lisp_cffi, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_usocket fcgi ];
      inherit stdenv;
      systemName = "cl-fastcgi";
      
      sourceProject = "${lisp-project_cl-fastcgi}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_usocket}";
      name = "lisp_cl-fastcgi-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
