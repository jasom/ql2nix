
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-finalizer, 
   lisp_trivial-garbage, lisp_cffi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_cffi  ];
      inherit stdenv;
      systemName = "simple-finalizer";
      
      sourceProject = "${lisp-project_simple-finalizer}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_cffi}";
      name = "lisp_simple-finalizer-20101006-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
