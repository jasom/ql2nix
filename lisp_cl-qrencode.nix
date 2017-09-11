
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-qrencode, 
   lisp_zpng,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zpng  ];
      inherit stdenv;
      systemName = "cl-qrencode";
      
      sourceProject = "${lisp-project_cl-qrencode}";
      patches = [];
      lisp_dependencies = "${lisp_zpng}";
      name = "lisp_cl-qrencode-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
