
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-autowrap, 
   lisp_defpackage-plus, lisp_cl-ppcre, lisp_cl-json, lisp_cffi, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defpackage-plus lisp_cl-ppcre lisp_cl-json lisp_cffi lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-plus-c";
      
      sourceProject = "${lisp-project_cl-autowrap}";
      patches = [];
      lisp_dependencies = "${lisp_defpackage-plus} ${lisp_cl-ppcre} ${lisp_cl-json} ${lisp_cffi} ${lisp_alexandria}";
      name = "lisp_cl-plus-c-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
