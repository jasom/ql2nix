
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickproject, 
   lisp_html-template, lisp_cl-fad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_html-template lisp_cl-fad  ];
      inherit stdenv;
      systemName = "quickproject";
      
      sourceProject = "${lisp-project_quickproject}";
      patches = [];
      lisp_dependencies = "${lisp_html-template} ${lisp_cl-fad}";
      name = "lisp_quickproject-1.2.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
