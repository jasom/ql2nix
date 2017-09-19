
{ buildLispPackage, stdenv, fetchurl, lisp-project_fnv, 
   lisp_trivial-garbage, lisp_iterate, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_iterate lisp_cffi  ];
      inherit stdenv;
      systemName = "org.middleangle.foreign-numeric-vector";
      
      sourceProject = "${lisp-project_fnv}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_iterate} ${lisp_cffi}";
      name = "lisp_org-middleangle-foreign-numeric-vector-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
