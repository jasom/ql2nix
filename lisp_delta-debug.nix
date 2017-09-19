
{ buildLispPackage, stdenv, fetchurl, lisp-project_delta-debug, 
   lisp_curry-compose-reader-macros, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_curry-compose-reader-macros lisp_alexandria  ];
      inherit stdenv;
      systemName = "delta-debug";
      
      sourceProject = "${lisp-project_delta-debug}";
      patches = [];
      lisp_dependencies = "${lisp_curry-compose-reader-macros} ${lisp_alexandria}";
      name = "lisp_delta-debug-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
