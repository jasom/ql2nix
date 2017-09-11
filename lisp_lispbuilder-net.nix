
{ buildLispPackage, stdenv, fetchurl, lisp-project_lispbuilder, 
   lisp_cffi, lisp_lispbuilder-net-cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_lispbuilder-net-cffi  ];
      inherit stdenv;
      systemName = "lispbuilder-net";
      
      sourceProject = "${lisp-project_lispbuilder}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_lispbuilder-net-cffi}";
      name = "lisp_lispbuilder-net-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
