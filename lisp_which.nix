
{ buildLispPackage, stdenv, fetchurl, lisp-project_which, 
   lisp_cl-fad, lisp_path-parse,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_path-parse  ];
      inherit stdenv;
      systemName = "which";
      
      sourceProject = "${lisp-project_which}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_path-parse}";
      name = "lisp_which-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
