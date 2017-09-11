
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-data-format-validation, 
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
      systemName = "data-format-validation";
      
      sourceProject = "${lisp-project_cl-data-format-validation}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre}";
      name = "lisp_data-format-validation-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
