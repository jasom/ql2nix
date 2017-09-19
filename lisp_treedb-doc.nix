
{ buildLispPackage, stdenv, fetchurl, lisp-project_treedb, 
   lisp_cl-gendoc, lisp_fiveam, lisp_cl-json,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gendoc lisp_fiveam lisp_cl-json  ];
      inherit stdenv;
      systemName = "treedb.doc";
      
      sourceProject = "${lisp-project_treedb}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gendoc} ${lisp_fiveam} ${lisp_cl-json}";
      name = "lisp_treedb-doc-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
