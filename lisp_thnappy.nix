
{ buildLispPackage, stdenv, fetchurl, lisp-project_thnappy, 
  snappy,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi snappy ];
      inherit stdenv;
      systemName = "thnappy";
      
      sourceProject = "${lisp-project_thnappy}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_thnappy-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
