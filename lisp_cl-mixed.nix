
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mixed, 
   lisp_alexandria, lisp_cffi, lisp_documentation-utils, lisp_trivial-features, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_documentation-utils lisp_trivial-features lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-mixed";
      
      sourceProject = "${lisp-project_cl-mixed}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_documentation-utils} ${lisp_trivial-features} ${lisp_trivial-garbage}";
      name = "lisp_cl-mixed-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
