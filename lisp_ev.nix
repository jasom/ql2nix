
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ev, 
  libev,   lisp_trivial-garbage, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi libev ];
      inherit stdenv;
      systemName = "ev";
      
      sourceProject = "${lisp-project_cl-ev}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_ev-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
