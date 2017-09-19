
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-nxt, 
   lisp_static-vectors, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_static-vectors lisp_cffi  ];
      inherit stdenv;
      systemName = "nxt";
      
      sourceProject = "${lisp-project_cl-nxt}";
      patches = [];
      lisp_dependencies = "${lisp_static-vectors} ${lisp_cffi}";
      name = "lisp_nxt-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
