
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql-fluid, 
   lisp_bordeaux-threads, lisp_closer-mop, lisp_clsql,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_closer-mop lisp_clsql  ];
      inherit stdenv;
      systemName = "clsql-fluid";
      
      sourceProject = "${lisp-project_clsql-fluid}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_closer-mop} ${lisp_clsql}";
      name = "lisp_clsql-fluid-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
