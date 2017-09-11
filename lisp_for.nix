
{ buildLispPackage, stdenv, fetchurl, lisp-project_for, 
   lisp_documentation-utils, lisp_lambda-fiddle, lisp_form-fiddle,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_lambda-fiddle lisp_form-fiddle  ];
      inherit stdenv;
      systemName = "for";
      
      sourceProject = "${lisp-project_for}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_lambda-fiddle} ${lisp_form-fiddle}";
      name = "lisp_for-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
