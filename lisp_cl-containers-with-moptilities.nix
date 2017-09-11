
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-containers, 
   lisp_cl-containers, lisp_moptilities,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-containers lisp_moptilities  ];
      inherit stdenv;
      systemName = "cl-containers/with-moptilities";
      
      sourceProject = "${lisp-project_cl-containers}";
      patches = [];
      lisp_dependencies = "${lisp_cl-containers} ${lisp_moptilities}";
      name = "lisp_cl-containers-with-moptilities-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
