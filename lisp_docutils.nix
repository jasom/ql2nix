
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-docutils, 
   lisp_data-format-validation, lisp_trivial-gray-streams, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_data-format-validation lisp_trivial-gray-streams lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "docutils";
      
      sourceProject = "${lisp-project_cl-docutils}";
      patches = [];
      lisp_dependencies = "${lisp_data-format-validation} ${lisp_trivial-gray-streams} ${lisp_cl-ppcre}";
      name = "lisp_docutils-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
