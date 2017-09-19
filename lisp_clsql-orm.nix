
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql-orm, 
   lisp_symbol-munger, lisp_cl-inflector, lisp_cl-interpol, lisp_cl-ppcre, lisp_clsql,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_symbol-munger lisp_cl-inflector lisp_cl-interpol lisp_cl-ppcre lisp_clsql  ];
      inherit stdenv;
      systemName = "clsql-orm";
      
      sourceProject = "${lisp-project_clsql-orm}";
      patches = [];
      lisp_dependencies = "${lisp_symbol-munger} ${lisp_cl-inflector} ${lisp_cl-interpol} ${lisp_cl-ppcre} ${lisp_clsql}";
      name = "lisp_clsql-orm-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
