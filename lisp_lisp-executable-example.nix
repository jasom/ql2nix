
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-executable, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "lisp-executable-example";
      
      sourceProject = "${lisp-project_lisp-executable}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_lisp-executable-example-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
