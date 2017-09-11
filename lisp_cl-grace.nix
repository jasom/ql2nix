
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-grace, 
   lisp_cl-fad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad  ];
      inherit stdenv;
      systemName = "cl-grace";
      
      sourceProject = "${lisp-project_cl-grace}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad}";
      name = "lisp_cl-grace-20160825-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
