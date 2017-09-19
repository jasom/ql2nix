
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-interpol, 
   lisp_cl-unicode,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-unicode  ];
      inherit stdenv;
      systemName = "cl-interpol";
      
      sourceProject = "${lisp-project_cl-interpol}";
      patches = [];
      lisp_dependencies = "${lisp_cl-unicode}";
      name = "lisp_cl-interpol-0.2.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
