
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickproject, 
   lisp_cl-fad, lisp_html-template,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_html-template  ];
      inherit stdenv;
      systemName = "quickproject";
      
      sourceProject = "${lisp-project_quickproject}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_html-template}";
      name = "lisp_quickproject-1.2.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
