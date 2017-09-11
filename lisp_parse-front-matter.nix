
{ buildLispPackage, stdenv, fetchurl, lisp-project_parse-front-matter, 
   lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "parse-front-matter";
      
      sourceProject = "${lisp-project_parse-front-matter}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_parse-front-matter-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
