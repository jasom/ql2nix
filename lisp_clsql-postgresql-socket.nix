
{ buildLispPackage, stdenv, fetchurl, lisp-project_clsql, 
   lisp_md5, lisp_uffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_md5 lisp_uffi  ];
      inherit stdenv;
      systemName = "clsql-postgresql-socket";
      
      sourceProject = "${lisp-project_clsql}";
      patches = [];
      lisp_dependencies = "${lisp_md5} ${lisp_uffi}";
      name = "lisp_clsql-postgresql-socket-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
