
{ buildLispPackage, stdenv, fetchurl, lisp-project_legit, 
   lisp_simple-inferiors, lisp_lambda-fiddle, lisp_cl-ppcre, lisp_documentation-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_simple-inferiors lisp_lambda-fiddle lisp_cl-ppcre lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "legit";
      
      sourceProject = "${lisp-project_legit}";
      patches = [];
      lisp_dependencies = "${lisp_simple-inferiors} ${lisp_lambda-fiddle} ${lisp_cl-ppcre} ${lisp_documentation-utils}";
      name = "lisp_legit-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
