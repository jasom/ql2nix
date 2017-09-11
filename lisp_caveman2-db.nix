
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_caveman-middleware-dbimanager, lisp_sxql,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_caveman-middleware-dbimanager lisp_sxql  ];
      inherit stdenv;
      systemName = "caveman2-db";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_caveman-middleware-dbimanager} ${lisp_sxql}";
      name = "lisp_caveman2-db-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
