
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-rfc-1123, 
   lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "trivial-rfc-1123";
      
      sourceProject = "${lisp-project_trivial-rfc-1123}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_trivial-rfc-1123-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
