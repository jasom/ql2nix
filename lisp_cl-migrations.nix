
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-migrations, 
   lisp_clsql,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql  ];
      inherit stdenv;
      systemName = "cl-migrations";
      
      sourceProject = "${lisp-project_cl-migrations}";
      patches = [];
      lisp_dependencies = "${lisp_clsql}";
      name = "lisp_cl-migrations-20110110-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
