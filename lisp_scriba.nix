
{ buildLispPackage, stdenv, fetchurl, lisp-project_scriba, 
   lisp_common-doc-plump, lisp_esrap, lisp_plump-sexp,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc-plump lisp_esrap lisp_plump-sexp  ];
      inherit stdenv;
      systemName = "scriba";
      
      sourceProject = "${lisp-project_scriba}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc-plump} ${lisp_esrap} ${lisp_plump-sexp}";
      name = "lisp_scriba-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
