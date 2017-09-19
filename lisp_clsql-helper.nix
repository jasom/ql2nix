
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql-helper, 
   lisp_collectors, lisp_access, lisp_md5, lisp_symbol-munger, lisp_cl-interpol, lisp_cl-ppcre, lisp_closer-mop, lisp_clsql, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_collectors lisp_access lisp_md5 lisp_symbol-munger lisp_cl-interpol lisp_cl-ppcre lisp_closer-mop lisp_clsql lisp_iterate  ];
      inherit stdenv;
      systemName = "clsql-helper";
      
      sourceProject = "${lisp-project_clsql-helper}";
      patches = [];
      lisp_dependencies = "${lisp_collectors} ${lisp_access} ${lisp_md5} ${lisp_symbol-munger} ${lisp_cl-interpol} ${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_clsql} ${lisp_iterate}";
      name = "lisp_clsql-helper-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
