
{ buildLispPackage, stdenv, fetchurl, lisp-project_extended-reals, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "extended-reals";
      
      sourceProject = "${lisp-project_extended-reals}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_extended-reals-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
