
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cl-ana-table,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ana-table  ];
      inherit stdenv;
      systemName = "cl-ana.reusable-table";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ana-table}";
      name = "lisp_cl-ana-reusable-table-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
