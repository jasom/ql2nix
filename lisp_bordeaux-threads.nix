
{ buildLispPackage, stdenv, fetchurl, lisp-project_bordeaux-threads, 
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
      systemName = "bordeaux-threads";
      
      sourceProject = "${lisp-project_bordeaux-threads}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_bordeaux-threads-v0.8.5";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
