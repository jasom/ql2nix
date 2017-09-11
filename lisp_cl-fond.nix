
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fond, 
   lisp_alexandria, lisp_cffi, lisp_cl-opengl, lisp_documentation-utils, lisp_trivial-features, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-opengl lisp_documentation-utils lisp_trivial-features lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-fond";
      
      sourceProject = "${lisp-project_cl-fond}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-opengl} ${lisp_documentation-utils} ${lisp_trivial-features} ${lisp_trivial-garbage}";
      name = "lisp_cl-fond-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
