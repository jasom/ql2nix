
{ buildLispPackage, stdenv, fetchurl, lisp-project_for, 
   lisp_form-fiddle, lisp_lambda-fiddle, lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_form-fiddle lisp_lambda-fiddle lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "for";
      
      sourceProject = "${lisp-project_for}";
      patches = [];
      lisp_dependencies = "${lisp_form-fiddle} ${lisp_lambda-fiddle} ${lisp_documentation-utils}";
      name = "lisp_for-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
