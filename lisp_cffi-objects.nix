
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi-objects, 
   lisp_closer-mop, lisp_trivial-garbage, lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_trivial-garbage lisp_cffi  ];
      inherit stdenv;
      systemName = "cffi-objects";
      
      sourceProject = "${lisp-project_cffi-objects}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_cffi-objects-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
