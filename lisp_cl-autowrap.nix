
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-autowrap, 
   lisp_alexandria, lisp_cffi, lisp_cl-json, lisp_cl-ppcre, lisp_defpackage-plus, lisp_trivial-features,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cl-json lisp_cl-ppcre lisp_defpackage-plus lisp_trivial-features  ];
      inherit stdenv;
      systemName = "cl-autowrap";
      
      sourceProject = "${lisp-project_cl-autowrap}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cl-json} ${lisp_cl-ppcre} ${lisp_defpackage-plus} ${lisp_trivial-features}";
      name = "lisp_cl-autowrap-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
