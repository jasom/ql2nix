
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_cl-ana-string-utils, lisp_cl-ana-symbol-utils, lisp_cl-ana-table,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ana-string-utils lisp_cl-ana-symbol-utils lisp_cl-ana-table  ];
      inherit stdenv;
      systemName = "cl-ana.table-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ana-string-utils} ${lisp_cl-ana-symbol-utils} ${lisp_cl-ana-table}";
      name = "lisp_cl-ana-table-utils-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
