
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-httpsqs, 
   lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-httpsqs";
      
      sourceProject = "${lisp-project_cl-httpsqs}";
      patches = [];
      lisp_dependencies = "${lisp_drakma}";
      name = "lisp_cl-httpsqs-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
