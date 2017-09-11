
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
   lisp_clsql, lisp_cffi-uffi-compat,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql lisp_cffi-uffi-compat  ];
      inherit stdenv;
      systemName = "clsql-cffi";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_clsql} ${lisp_cffi-uffi-compat}";
      name = "lisp_clsql-cffi-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
