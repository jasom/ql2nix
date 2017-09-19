
{ buildLispPackage, stdenv, fetchurl, lisp-project_cxml, 
   lisp_puri, lisp_closure-common,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_puri lisp_closure-common  ];
      inherit stdenv;
      systemName = "cxml";
      
      sourceProject = "${lisp-project_cxml}";
      patches = [];
      lisp_dependencies = "${lisp_puri} ${lisp_closure-common}";
      name = "lisp_cxml-20110619-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
