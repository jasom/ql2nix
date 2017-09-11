
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-docutils, 
   lisp_cl-ppcre, lisp_data-format-validation, lisp_trivial-gray-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_data-format-validation lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "docutils";
      
      sourceProject = "${lisp-project_cl-docutils}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_data-format-validation} ${lisp_trivial-gray-streams}";
      name = "lisp_docutils-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
