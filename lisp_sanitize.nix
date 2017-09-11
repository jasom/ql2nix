
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sanitize, 
   lisp_cl-libxml2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-libxml2  ];
      inherit stdenv;
      systemName = "sanitize";
      
      sourceProject = "${lisp-project_cl-sanitize}";
      patches = [];
      lisp_dependencies = "${lisp_cl-libxml2}";
      name = "lisp_sanitize-20130720-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
