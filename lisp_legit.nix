
{ buildLispPackage, stdenv, fetchurl, lisp-project_legit, 
   lisp_documentation-utils, lisp_cl-ppcre, lisp_lambda-fiddle, lisp_simple-inferiors,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_cl-ppcre lisp_lambda-fiddle lisp_simple-inferiors  ];
      inherit stdenv;
      systemName = "legit";
      
      sourceProject = "${lisp-project_legit}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_cl-ppcre} ${lisp_lambda-fiddle} ${lisp_simple-inferiors}";
      name = "lisp_legit-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
