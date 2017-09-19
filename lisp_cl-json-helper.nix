
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-json-helper, 
   lisp_cl-json,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json  ];
      inherit stdenv;
      systemName = "cl-json-helper";
      
      sourceProject = "${lisp-project_cl-json-helper}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json}";
      name = "lisp_cl-json-helper-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
