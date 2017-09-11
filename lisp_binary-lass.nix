
{ buildLispPackage, stdenv, fetchurl, lisp-project_lass, 
   lisp_lass,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lass  ];
      inherit stdenv;
      systemName = "binary-lass";
      
      sourceProject = "${lisp-project_lass}";
      patches = [];
      lisp_dependencies = "${lisp_lass}";
      name = "lisp_binary-lass-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
