
{ buildLispPackage, stdenv, fetchurl, lisp-project_clods-export, 
   lisp_zip, lisp_cxml, lisp_local-time, lisp_iterate, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zip lisp_cxml lisp_local-time lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "clods-export";
      
      sourceProject = "${lisp-project_clods-export}";
      patches = [];
      lisp_dependencies = "${lisp_zip} ${lisp_cxml} ${lisp_local-time} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_clods-export-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
