
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_cffi, lisp_split-sequence, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-ana.typed-table";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_cl-ana-typed-table-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
