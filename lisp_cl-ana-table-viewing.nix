
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_external-program, lisp_gsll, lisp_closer-mop, lisp_iterate, lisp_split-sequence, lisp_alexandria,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_external-program lisp_gsll lisp_closer-mop lisp_iterate lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-ana.table-viewing";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_external-program} ${lisp_gsll} ${lisp_closer-mop} ${lisp_iterate} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_cl-ana-table-viewing-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
