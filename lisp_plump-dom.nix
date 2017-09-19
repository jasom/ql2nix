
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump, 
   lisp_array-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-utils  ];
      inherit stdenv;
      systemName = "plump-dom";
      
      sourceProject = "${lisp-project_plump}";
      patches = [];
      lisp_dependencies = "${lisp_array-utils}";
      name = "lisp_plump-dom-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
