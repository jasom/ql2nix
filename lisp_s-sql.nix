
{ buildLispPackage, stdenv, fetchurl, lisp-project_postmodern, 
   lisp_cl-postgres,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-postgres  ];
      inherit stdenv;
      systemName = "s-sql";
      
      sourceProject = "${lisp-project_postmodern}";
      patches = [];
      lisp_dependencies = "${lisp_cl-postgres}";
      name = "lisp_s-sql-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
